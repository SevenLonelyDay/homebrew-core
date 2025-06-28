class Ipsw < Formula
  desc "Research tool for iOS & macOS devices"
  homepage "https://blacktop.github.io/ipsw"
  url "https://github.com/blacktop/ipsw/archive/refs/tags/v3.1.617.tar.gz"
  sha256 "a1b91c27dda30d0a34919ada95d3569d1085611f4de1130cea9d743f17f2acec"
  license "MIT"
  head "https://github.com/blacktop/ipsw.git", branch: "master"

  livecheck do
    url :stable
    strategy :github_latest
  end

  bottle do
    sha256 cellar: :any_skip_relocation, arm64_sequoia: "388ad5b5ff1bd33e075b7530a5a5c44e56981372cccbae70ec9e1fb3bafdef13"
    sha256 cellar: :any_skip_relocation, arm64_sonoma:  "899580c7ae98f07df7d75a7df74fe64e5811b50e289280b6adbcd70f87da378e"
    sha256 cellar: :any_skip_relocation, arm64_ventura: "52b9cdc569f5184324b2182cff346242499597e6857bcb2ca2168dc5ee2d3e25"
    sha256 cellar: :any_skip_relocation, sonoma:        "db332589639bb791d96e571a9f770a1f1aa1d6c7fe1198f387d27c99faf9f00e"
    sha256 cellar: :any_skip_relocation, ventura:       "407580ff1384bcac06e789052675731d805fb2ace5a29e1b067a41d9f86655af"
    sha256 cellar: :any_skip_relocation, arm64_linux:   "abf1307f43af98d620b85cbdb1f8be04b578e506c529851c23efe69c85da9b9a"
    sha256 cellar: :any_skip_relocation, x86_64_linux:  "32b533ba4059859e4d9ed76f67cd3c718d1d7fc08fafbc90dfb03bdbbbb4f902"
  end

  depends_on "go" => :build

  def install
    ldflags = %W[
      -s -w
      -X github.com/blacktop/ipsw/cmd/ipsw/cmd.AppVersion=#{version}
      -X github.com/blacktop/ipsw/cmd/ipsw/cmd.AppBuildCommit=#{tap.user}
    ]
    system "go", "build", *std_go_args(ldflags:), "./cmd/ipsw"
    generate_completions_from_executable(bin/"ipsw", "completion")
  end

  test do
    assert_match version.to_s, shell_output(bin/"ipsw version")

    assert_match "MacFamily20,1", shell_output(bin/"ipsw device-list")
  end
end
