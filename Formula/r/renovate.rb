class Renovate < Formula
  desc "Automated dependency updates. Flexible so you don't need to be"
  homepage "https://github.com/renovatebot/renovate"
  url "https://registry.npmjs.org/renovate/-/renovate-41.20.0.tgz"
  sha256 "89e9af7ab526a5ca84f7c9a4358e21bfbd389f30b897065ab5b5908e8f28ec17"
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
    sha256 cellar: :any_skip_relocation, arm64_sequoia: "a38fd4feecddfd6ee33ae9e579d705bb35d260cdc6fd4c5d9f6622478409bc02"
    sha256 cellar: :any_skip_relocation, arm64_sonoma:  "137fb62bd524b3ec66455431a200625ca8dd8bb0c90341a8b97ead4974b62475"
    sha256 cellar: :any_skip_relocation, arm64_ventura: "6811d05250c45ee3b06e1ea84a666641895036a9a757fb9e3c8b950d4b7c6529"
    sha256 cellar: :any_skip_relocation, sonoma:        "3ab4ebb257dada5d1fcfb41d334ff01975d13901fba325d4a65cd801251f83d9"
    sha256 cellar: :any_skip_relocation, ventura:       "14a8b9b75a9d076557577964eed041fae4e417b6978a166fc40e68d5455bb0ed"
    sha256 cellar: :any_skip_relocation, arm64_linux:   "2f68548a367f0123191a9537b09efeb6aa8d9dde5b39a2ae91db39193e964cdc"
    sha256 cellar: :any_skip_relocation, x86_64_linux:  "a814fbb7d39e41d9117bef71165dcce074ce723dc24b33012793e7806a2b3b0c"
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
