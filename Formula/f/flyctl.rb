class Flyctl < Formula
  desc "Command-line tools for fly.io services"
  homepage "https://fly.io"
  url "https://github.com/superfly/flyctl.git",
      tag:      "v0.3.22",
      revision: "ea488ce59286ff7d0bf27214255fc3563329701b"
  license "Apache-2.0"
  head "https://github.com/superfly/flyctl.git", branch: "master"

  # Upstream tags versions like `v0.1.92` and `v2023.9.8` but, as of writing,
  # they only create releases for the former and those are the versions we use
  # in this formula. We could omit the date-based versions using a regex but
  # this uses the `GithubLatest` strategy, as the upstream repository also
  # contains over a thousand tags (and growing).
  livecheck do
    url :stable
    strategy :github_latest
  end

  bottle do
    sha256 cellar: :any_skip_relocation, arm64_sequoia: "3149152081af2239ef5d2cb5be5bcdb08d198768d031cff344b2c6494fbf70cd"
    sha256 cellar: :any_skip_relocation, arm64_sonoma:  "3149152081af2239ef5d2cb5be5bcdb08d198768d031cff344b2c6494fbf70cd"
    sha256 cellar: :any_skip_relocation, arm64_ventura: "3149152081af2239ef5d2cb5be5bcdb08d198768d031cff344b2c6494fbf70cd"
    sha256 cellar: :any_skip_relocation, sonoma:        "64309424d30a89c4943655862956bfcd437d8e63b60fb3603ab7cc0227da0809"
    sha256 cellar: :any_skip_relocation, ventura:       "64309424d30a89c4943655862956bfcd437d8e63b60fb3603ab7cc0227da0809"
    sha256 cellar: :any_skip_relocation, x86_64_linux:  "85fcd07fa0a8a46603daff4ba96db0a882a561676d79a1d99d9dfcabf0a1090f"
  end

  depends_on "go" => :build

  def install
    ENV["CGO_ENABLED"] = "0"
    ldflags = %W[
      -s -w
      -X github.com/superfly/flyctl/internal/buildinfo.buildDate=#{time.iso8601}
      -X github.com/superfly/flyctl/internal/buildinfo.buildVersion=#{version}
      -X github.com/superfly/flyctl/internal/buildinfo.commit=#{Utils.git_short_head}
    ]
    system "go", "build", *std_go_args(ldflags:), "-tags", "production"

    bin.install_symlink "flyctl" => "fly"

    generate_completions_from_executable(bin/"flyctl", "completion")
  end

  test do
    assert_match "flyctl v#{version}", shell_output("#{bin}/flyctl version")

    flyctl_status = shell_output("#{bin}/flyctl status 2>&1", 1)
    assert_match "Error: No access token available. Please login with 'flyctl auth login'", flyctl_status
  end
end
