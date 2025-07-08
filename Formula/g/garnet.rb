class Garnet < Formula
  desc "High-performance cache-store"
  homepage "https://microsoft.github.io/garnet/"
  url "https://github.com/microsoft/garnet/archive/refs/tags/v1.0.76.tar.gz"
  sha256 "5979d3c0690dfb775b80d227b3869b385ae997159f6e9883c7ad38d66603ba21"
  license "MIT"

  bottle do
    sha256 cellar: :any,                 arm64_sequoia: "74e624ee3b52edd838f5b351fb8873b0b5487f413521e58cd6e2bf36f623b8cf"
    sha256 cellar: :any,                 arm64_sonoma:  "2162519194d708642cf4c0068ba78883a2c4435b8aec5df92a05420973e1b7d6"
    sha256 cellar: :any,                 arm64_ventura: "5e431ca4d21200758bf1f991fd3881124dec55dc4fa224953db0410637feeb4e"
    sha256 cellar: :any,                 ventura:       "ba586becf6475583944d6ffbc1d50d2c605057992832aeec855f53aa7d263545"
    sha256 cellar: :any_skip_relocation, arm64_linux:   "82d50c65805d849a8e502b3f8adb028a5c2ac2a28bd2b66669494a653b95cc43"
    sha256 cellar: :any_skip_relocation, x86_64_linux:  "d21951c538069a4e8dce1ee4e3c295976fb9e34e4b6bcfdbf1281a464bbfc5ba"
  end

  depends_on "valkey" => :test
  depends_on "dotnet"

  on_linux do
    depends_on "cmake" => :build
    depends_on "util-linux" => :build
    depends_on "libaio"
  end

  def install
    if OS.linux?
      cd "libs/storage/Tsavorite/cc" do
        # Fix to cmake version 4 compatibility
        arg = "-DCMAKE_POLICY_VERSION_MINIMUM=3.5"
        system "cmake", "-S", ".", "-B", "build", arg, *std_cmake_args
        system "cmake", "--build", "build"
        rm "../cs/src/core/Device/runtimes/linux-x64/native/libnative_device.so"
        cp "build/libnative_device.so", "../cs/src/core/Device/runtimes/linux-x64/native/libnative_device.so"
      end
    end

    dotnet = Formula["dotnet"]
    args = %W[
      --configuration Release
      --framework net#{dotnet.version.major_minor}
      --output #{libexec}
      --no-self-contained
      --use-current-runtime
      -p:PublishSingleFile=true
      -p:EnableSourceLink=false
      -p:EnableSourceControlManagerQueries=false
    ]
    system "dotnet", "publish", "main/GarnetServer/GarnetServer.csproj", *args
    (bin/"GarnetServer").write_env_script libexec/"GarnetServer", DOTNET_ROOT: dotnet.opt_libexec

    # Replace universal binaries with their native slices.
    deuniversalize_machos
  end

  test do
    port = free_port
    fork do
      exec bin/"GarnetServer", "--port", port.to_s
    end
    sleep 3

    output = shell_output("#{Formula["valkey"].opt_bin}/valkey-cli -h 127.0.0.1 -p #{port} ping")
    assert_equal "PONG", output.strip
  end
end
