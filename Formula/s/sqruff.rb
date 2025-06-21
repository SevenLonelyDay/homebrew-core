class Sqruff < Formula
  desc "Fast SQL formatter/linter"
  homepage "https://github.com/quarylabs/sqruff"
  url "https://github.com/quarylabs/sqruff/archive/refs/tags/v0.26.7.tar.gz"
  sha256 "0f52f1866252afa3db165009052369055802c866c77cbf2ffda24e3c73cf7f4c"
  license "Apache-2.0"
  head "https://github.com/quarylabs/sqruff.git", branch: "main"

  bottle do
    sha256 cellar: :any_skip_relocation, arm64_sequoia: "3dcbea0b08bf23ce829b97dbe0fa9ad476fda68a746811f84bea4da4a74c6d6a"
    sha256 cellar: :any_skip_relocation, arm64_sonoma:  "54804ed921f350735f8b80d9cfcf58802c4c29b1d6c6f91ca06b53e473c93b15"
    sha256 cellar: :any_skip_relocation, arm64_ventura: "1d1214949a1d40bde0cbd0c9c75618d57ff4d072686fdb9b750ed0534502c3f3"
    sha256 cellar: :any_skip_relocation, sonoma:        "61cb811ff9bf871429d5f29c7a0807f4968c5bd69efbc635daef43c4f0b0f0fe"
    sha256 cellar: :any_skip_relocation, ventura:       "1d23605d34e110c56c0dc6487c2fe680ae0be5c2fd75ef1011f1ed91b6edf28c"
    sha256 cellar: :any_skip_relocation, arm64_linux:   "67d88766a29d1e445ca44c45b58255d0e53d63f8dc3d57e532162f9966a14966"
    sha256 cellar: :any_skip_relocation, x86_64_linux:  "e11a31f9be443157d867e3175eed88b3c81503258032ff3db21e8ab71d33cffc"
  end

  depends_on "rust" => :build

  def install
    system "cargo", "install", "--bin", "sqruff", *std_cargo_args(path: "crates/cli")
  end

  test do
    assert_match version.to_s, shell_output("#{bin}/sqruff --version")

    assert_match "AL01:	[aliasing.table]", shell_output("#{bin}/sqruff rules")

    (testpath/"test.sql").write <<~EOS
      SELECT * FROM user JOIN order ON user.id = order.user_id;
    EOS

    output = shell_output("#{bin}/sqruff lint --format human #{testpath}/test.sql 2>&1")
    assert_match "All Finished", output
  end
end
