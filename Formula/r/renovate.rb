class Renovate < Formula
  desc "Automated dependency updates. Flexible so you don't need to be"
  homepage "https://github.com/renovatebot/renovate"
  url "https://registry.npmjs.org/renovate/-/renovate-40.56.0.tgz"
  sha256 "e88cbdb4ae724e87e6cf219496e8d0bd1e05c00d8406bf3c80ffbf79c69e9998"
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
    sha256 cellar: :any_skip_relocation, arm64_sequoia: "349254ea8272bf32bbe1d1b76db03a5d66244e8c51bbe8907512d33da25ccc3b"
    sha256 cellar: :any_skip_relocation, arm64_sonoma:  "af937265667882cef2e08afa217e76a9f8f652a161d983a7c643af3651bfb508"
    sha256 cellar: :any_skip_relocation, arm64_ventura: "77f97a2cfb8a0f1a9d5c98360753f66235fa2cbcb8e785bac0f0fe3b622a1b04"
    sha256 cellar: :any_skip_relocation, sonoma:        "096dbf485db30ef33fffb00d9604ce1f2120b1481be97921ba1f1fddf1627d27"
    sha256 cellar: :any_skip_relocation, ventura:       "623803f633768a4361a45ba8ae0cc519ccdd7ad8ab951be3b463bd6965f723ce"
    sha256 cellar: :any_skip_relocation, arm64_linux:   "a4be93e0e5ca4f7223705836725239c0750ad0528e70842cef959be44c008875"
    sha256 cellar: :any_skip_relocation, x86_64_linux:  "8bb9157d78847cf4a86331ec29110fe1e4c4be30dcbdff08e7624f4846b31fa0"
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
