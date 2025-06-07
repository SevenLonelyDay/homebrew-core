class Renovate < Formula
  desc "Automated dependency updates. Flexible so you don't need to be"
  homepage "https://github.com/renovatebot/renovate"
  url "https://registry.npmjs.org/renovate/-/renovate-40.47.0.tgz"
  sha256 "ca119850fb884bcd0b6f425233f50db7bd489d6297617bc556be12a8e86c5055"
  license "AGPL-3.0-only"

  # There are thousands of renovate releases on npm and the page the `Npm`
  # strategy checks is several MB in size and can time out before the request
  # resolves. This checks the first page of tags on GitHub (to minimize data
  # transfer).
  livecheck do
    url "https://github.com/renovatebot/renovate/tags"
    regex(%r{href=["']?[^"' >]*?/tag/v?(\d+(?:\.\d+)+)["' >]}i)
    strategy :page_match
    throttle 10
  end

  bottle do
    sha256 cellar: :any_skip_relocation, arm64_sequoia: "2d6231de62a813f0fc18b95313a67ebe50e0acd83d03b096fbe0a936b4d1bc44"
    sha256 cellar: :any_skip_relocation, arm64_sonoma:  "266a7547765aea2616787118a8b3562151e822f49a0d03b36f774250e6930d6c"
    sha256 cellar: :any_skip_relocation, arm64_ventura: "5d98b1f9b3827c85300e20d398ff80829e0c2844ba8e28d3e2445998eea9e909"
    sha256 cellar: :any_skip_relocation, sonoma:        "6ca07d9218b3d5cc4f37c14e2c0f00eb4bf327e5957b16d33139c04f9f3bc1f9"
    sha256 cellar: :any_skip_relocation, ventura:       "0fc86154050fd6cbab71595230b08f3de80478ec7b76600bcb0ddcec0bec91f4"
    sha256 cellar: :any_skip_relocation, arm64_linux:   "ef6bf958c8f73e39a9d63ff1a4626ae8835f1b54bf737d739b02b8054f665d3c"
    sha256 cellar: :any_skip_relocation, x86_64_linux:  "7b42360ae2390ecf068ae0c384f4bb87ed6ccc5459555a177621d95f723b2c97"
  end

  depends_on "node@22"

  uses_from_macos "git", since: :monterey

  def install
    system "npm", "install", *std_npm_args
    bin.install_symlink Dir["#{libexec}/bin/*"]
  end

  test do
    system bin/"renovate", "--platform=local", "--enabled=false"
  end
end
