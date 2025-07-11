class Oterm < Formula
  include Language::Python::Virtualenv

  desc "Terminal client for Ollama"
  homepage "https://github.com/ggozad/oterm"
  url "https://files.pythonhosted.org/packages/d1/25/f242536cc12d4acdcaf0764c7b168fffc221d787ddacd914dca6d29153e7/oterm-0.14.0.tar.gz"
  sha256 "8a08b77012ff95ff47caec6a65d410733041d2046efffe56ba4af58c1ce8b592"
  license "MIT"

  bottle do
    sha256 cellar: :any,                 arm64_sequoia: "d00693e311c375bcfdc7ebaa4c4c3a7785a91ed2430ebd66c5231a6faf85b260"
    sha256 cellar: :any,                 arm64_sonoma:  "688099b24e24ba4c9070d75588ca5c1e1f0ce8a6b32b7cd55f3eb337e0bf6095"
    sha256 cellar: :any,                 arm64_ventura: "9b322a2eebe346ce0637681f43628dde2a4991573eb22a878525fe12e78576e3"
    sha256 cellar: :any,                 sonoma:        "20b894af729db7c114a3ffbafec0124646da0907a877b37fdf183aaa10c951c4"
    sha256 cellar: :any,                 ventura:       "1068f96b730f967fd442ca306a909be1af40657b97c9d4f82b66bb9c0d693c6d"
    sha256 cellar: :any_skip_relocation, arm64_linux:   "ba7427ad11333b77d053cec081166a13497cefb8d79a53d093255534c9833946"
    sha256 cellar: :any_skip_relocation, x86_64_linux:  "17f82762d825c9180d13f159606fda0c241905af2eaaf6a478fee9a9ca15e0b7"
  end

  depends_on "pkgconf" => :build
  depends_on "rust" => :build
  depends_on "certifi"
  depends_on "cffi"
  depends_on "cryptography"
  depends_on "freetype"
  depends_on "jpeg-turbo"
  depends_on "libraqm"
  depends_on "libtiff"
  depends_on "little-cms2"
  depends_on "openjpeg"
  depends_on "pycparser"
  depends_on "python@3.13"

  uses_from_macos "zlib"

  resource "aiosql" do
    url "https://files.pythonhosted.org/packages/98/3a/105cdf480d444ee059f3fbea65616fba006fba29d32e382fb1a4d947f4b7/aiosql-13.4.tar.gz"
    sha256 "da6ebb4d5e735753853007a7d574e60761338fc6ca8d95d6d95b5d85d7b1354d"
  end

  resource "aiosqlite" do
    url "https://files.pythonhosted.org/packages/13/7d/8bca2bf9a247c2c5dfeec1d7a5f40db6518f88d314b8bca9da29670d2671/aiosqlite-0.21.0.tar.gz"
    sha256 "131bb8056daa3bc875608c631c678cda73922a2d4ba8aec373b19f18c17e7aa3"
  end

  resource "annotated-types" do
    url "https://files.pythonhosted.org/packages/ee/67/531ea369ba64dcff5ec9c3402f9f51bf748cec26dde048a2f973a4eea7f5/annotated_types-0.7.0.tar.gz"
    sha256 "aff07c09a53a08bc8cfccb9c85b05f1aa9a2a6f23728d790723543408344ce89"
  end

  resource "anyio" do
    url "https://files.pythonhosted.org/packages/95/7d/4c1bd541d4dffa1b52bd83fb8527089e097a106fc90b467a7313b105f840/anyio-4.9.0.tar.gz"
    sha256 "673c0c244e15788651a4ff38710fea9675823028a6f08a5eda409e0c9840a028"
  end

  resource "authlib" do
    url "https://files.pythonhosted.org/packages/a2/9d/b1e08d36899c12c8b894a44a5583ee157789f26fc4b176f8e4b6217b56e1/authlib-1.6.0.tar.gz"
    sha256 "4367d32031b7af175ad3a323d571dc7257b7099d55978087ceae4a0d88cd3210"
  end

  resource "click" do
    url "https://files.pythonhosted.org/packages/b9/2e/0090cbf739cee7d23781ad4b89a9894a41538e4fcf4c31dcdd705b78eb8b/click-8.1.8.tar.gz"
    sha256 "ed53c9d8990d83c2a27deae68e4ee337473f6330c040a31d4225c9574d16096a"
  end

  resource "exceptiongroup" do
    url "https://files.pythonhosted.org/packages/0b/9f/a65090624ecf468cdca03533906e7c69ed7588582240cfe7cc9e770b50eb/exceptiongroup-1.3.0.tar.gz"
    sha256 "b241f5885f560bc56a59ee63ca4c6a8bfa46ae4ad651af316d4e81817bb9fd88"
  end

  resource "fastmcp" do
    url "https://files.pythonhosted.org/packages/8d/a3/d5b2c47b25d13cca8108e077bf4a72b255b113fb525f4c22ce9ca5af9b08/fastmcp-2.8.0.tar.gz"
    sha256 "8a6427ece23d0a324d4be2043598c8b89a91b2b5688873d8ae1e7aeaa7960513"
  end

  resource "h11" do
    url "https://files.pythonhosted.org/packages/01/ee/02a2c011bdab74c6fb3c75474d40b3052059d95df7e73351460c8588d963/h11-0.16.0.tar.gz"
    sha256 "4e35b956cf45792e4caa5885e69fba00bdbc6ffafbfa020300e549b208ee5ff1"
  end

  resource "httpcore" do
    url "https://files.pythonhosted.org/packages/06/94/82699a10bca87a5556c9c59b5963f2d039dbd239f25bc2a63907a05a14cb/httpcore-1.0.9.tar.gz"
    sha256 "6e34463af53fd2ab5d807f399a9b45ea31c3dfa2276f15a2c3f00afff6e176e8"
  end

  resource "httpx" do
    url "https://files.pythonhosted.org/packages/b1/df/48c586a5fe32a0f01324ee087459e112ebb7224f646c0b5023f5e79e9956/httpx-0.28.1.tar.gz"
    sha256 "75e98c5f16b0f35b567856f597f06ff2270a374470a5c2392242528e3e3e42fc"
  end

  resource "httpx-sse" do
    url "https://files.pythonhosted.org/packages/4c/60/8f4281fa9bbf3c8034fd54c0e7412e66edbab6bc74c4996bd616f8d0406e/httpx-sse-0.4.0.tar.gz"
    sha256 "1e81a3a3070ce322add1d3529ed42eb5f70817f45ed6ec915ab753f961139721"
  end

  resource "idna" do
    url "https://files.pythonhosted.org/packages/f1/70/7703c29685631f5a7590aa73f1f1d3fa9a380e654b86af429e0934a32f7d/idna-3.10.tar.gz"
    sha256 "12f65c9b470abda6dc35cf8e63cc574b1c52b11df2c86030af0ac09b01b13ea9"
  end

  resource "linkify-it-py" do
    url "https://files.pythonhosted.org/packages/2a/ae/bb56c6828e4797ba5a4821eec7c43b8bf40f69cda4d4f5f8c8a2810ec96a/linkify-it-py-2.0.3.tar.gz"
    sha256 "68cda27e162e9215c17d786649d1da0021a451bdc436ef9e0fa0ba5234b9b048"
  end

  resource "markdown-it-py" do
    url "https://files.pythonhosted.org/packages/38/71/3b932df36c1a044d397a1f92d1cf91ee0a503d91e470cbd670aa66b07ed0/markdown-it-py-3.0.0.tar.gz"
    sha256 "e3f60a94fa066dc52ec76661e37c851cb232d92f9886b15cb560aaada2df8feb"
  end

  resource "mcp" do
    url "https://files.pythonhosted.org/packages/06/f2/dc2450e566eeccf92d89a00c3e813234ad58e2ba1e31d11467a09ac4f3b9/mcp-1.9.4.tar.gz"
    sha256 "cfb0bcd1a9535b42edaef89947b9e18a8feb49362e1cc059d6e7fc636f2cb09f"
  end

  resource "mdit-py-plugins" do
    url "https://files.pythonhosted.org/packages/19/03/a2ecab526543b152300717cf232bb4bb8605b6edb946c845016fa9c9c9fd/mdit_py_plugins-0.4.2.tar.gz"
    sha256 "5f2cd1fdb606ddf152d37ec30e46101a60512bc0e5fa1a7002c36647b09e26b5"
  end

  resource "mdurl" do
    url "https://files.pythonhosted.org/packages/d6/54/cfe61301667036ec958cb99bd3efefba235e65cdeb9c84d24a8293ba1d90/mdurl-0.1.2.tar.gz"
    sha256 "bb413d29f5eea38f31dd4754dd7377d4465116fb207585f97bf925588687c1ba"
  end

  resource "ollama" do
    url "https://files.pythonhosted.org/packages/8d/96/c7fe0d2d1b3053be614822a7b722c7465161b3672ce90df71515137580a0/ollama-0.5.1.tar.gz"
    sha256 "5a799e4dc4e7af638b11e3ae588ab17623ee019e496caaf4323efbaa8feeff93"
  end

  resource "openapi-pydantic" do
    url "https://files.pythonhosted.org/packages/02/2e/58d83848dd1a79cb92ed8e63f6ba901ca282c5f09d04af9423ec26c56fd7/openapi_pydantic-0.5.1.tar.gz"
    sha256 "ff6835af6bde7a459fb93eb93bb92b8749b754fc6e51b2f1590a19dc3005ee0d"
  end

  resource "packaging" do
    url "https://files.pythonhosted.org/packages/a1/d4/1fc4078c65507b51b96ca8f8c3ba19e6a61c8253c72794544580a7b6c24d/packaging-25.0.tar.gz"
    sha256 "d443872c98d677bf60f6a1f2f8c1cb748e8fe762d2bf9d3148b5599295b0fc4f"
  end

  resource "pillow" do
    url "https://files.pythonhosted.org/packages/af/cb/bb5c01fcd2a69335b86c22142b2bccfc3464087efb7fd382eee5ffc7fdf7/pillow-11.2.1.tar.gz"
    sha256 "a64dd61998416367b7ef979b73d3a85853ba9bec4c2925f74e588879a58716b6"
  end

  resource "platformdirs" do
    url "https://files.pythonhosted.org/packages/fe/8b/3c73abc9c759ecd3f1f7ceff6685840859e8070c4d947c93fae71f6a0bf2/platformdirs-4.3.8.tar.gz"
    sha256 "3d512d96e16bcb959a814c9f348431070822a6496326a4be0911c40b5a74c2bc"
  end

  resource "pydantic" do
    url "https://files.pythonhosted.org/packages/f0/86/8ce9040065e8f924d642c58e4a344e33163a07f6b57f836d0d734e0ad3fb/pydantic-2.11.5.tar.gz"
    sha256 "7f853db3d0ce78ce8bbb148c401c2cdd6431b3473c0cdff2755c7690952a7b7a"
  end

  resource "pydantic-core" do
    url "https://files.pythonhosted.org/packages/ad/88/5f2260bdfae97aabf98f1778d43f69574390ad787afb646292a638c923d4/pydantic_core-2.33.2.tar.gz"
    sha256 "7cb8bc3605c29176e1b105350d2e6474142d7c1bd1d9327c4a9bdb46bf827acc"
  end

  resource "pydantic-settings" do
    url "https://files.pythonhosted.org/packages/67/1d/42628a2c33e93f8e9acbde0d5d735fa0850f3e6a2f8cb1eb6c40b9a732ac/pydantic_settings-2.9.1.tar.gz"
    sha256 "c509bf79d27563add44e8446233359004ed85066cd096d8b510f715e6ef5d268"
  end

  resource "pygments" do
    url "https://files.pythonhosted.org/packages/7c/2d/c3338d48ea6cc0feb8446d8e6937e1408088a72a39937982cc6111d17f84/pygments-2.19.1.tar.gz"
    sha256 "61c16d2a8576dc0649d9f39e089b5f02bcd27fba10d8fb4dcc28173f7a45151f"
  end

  resource "python-dotenv" do
    url "https://files.pythonhosted.org/packages/88/2c/7bb1416c5620485aa793f2de31d3df393d3686aa8a8506d11e10e13c5baf/python_dotenv-1.1.0.tar.gz"
    sha256 "41f90bc6f5f177fb41f53e87666db362025010eb28f60a01c9143bfa33a2b2d5"
  end

  resource "python-multipart" do
    url "https://files.pythonhosted.org/packages/f3/87/f44d7c9f274c7ee665a29b885ec97089ec5dc034c7f3fafa03da9e39a09e/python_multipart-0.0.20.tar.gz"
    sha256 "8dd0cab45b8e23064ae09147625994d090fa46f5b0d1e13af944c331a7fa9d13"
  end

  resource "rich" do
    url "https://files.pythonhosted.org/packages/a1/53/830aa4c3066a8ab0ae9a9955976fb770fe9c6102117c8ec4ab3ea62d89e8/rich-14.0.0.tar.gz"
    sha256 "82f1bc23a6a21ebca4ae0c45af9bdbc492ed20231dcb63f297d6d1021a9d5725"
  end

  resource "shellingham" do
    url "https://files.pythonhosted.org/packages/58/15/8b3609fd3830ef7b27b655beb4b4e9c62313a4e8da8c676e142cc210d58e/shellingham-1.5.4.tar.gz"
    sha256 "8dbca0739d487e5bd35ab3ca4b36e11c4078f3a234bfce294b0a0291363404de"
  end

  resource "sniffio" do
    url "https://files.pythonhosted.org/packages/a2/87/a6771e1546d97e7e041b6ae58d80074f81b7d5121207425c964ddf5cfdbd/sniffio-1.3.1.tar.gz"
    sha256 "f4324edc670a0f49750a81b895f35c3adb843cca46f0530f79fc1babb23789dc"
  end

  resource "sse-starlette" do
    url "https://files.pythonhosted.org/packages/8c/f4/989bc70cb8091eda43a9034ef969b25145291f3601703b82766e5172dfed/sse_starlette-2.3.6.tar.gz"
    sha256 "0382336f7d4ec30160cf9ca0518962905e1b69b72d6c1c995131e0a703b436e3"
  end

  resource "starlette" do
    url "https://files.pythonhosted.org/packages/8b/d0/0332bd8a25779a0e2082b0e179805ad39afad642938b371ae0882e7f880d/starlette-0.47.0.tar.gz"
    sha256 "1f64887e94a447fed5f23309fb6890ef23349b7e478faa7b24a851cd4eb844af"
  end

  resource "terminaltexteffects" do
    url "https://files.pythonhosted.org/packages/14/78/71c0ff84d2a7372ce029b22998fac27505771254bcdbccfa8fd3c786e7b0/terminaltexteffects-0.12.0.tar.gz"
    sha256 "84bfa7eefc4d03ede3b9a9794d26a224df34851534f993df6a237fdb744542ef"
  end

  resource "textual" do
    url "https://files.pythonhosted.org/packages/34/99/8408761a1a1076b2bb69d4859ec110d74be7515552407ac1cb6b68630eb6/textual-3.2.0.tar.gz"
    sha256 "d2f3b0c39e02535bb5f2aec1c45e10bd3ee7508ed1e240b7505c3cf02a6f00ed"
  end

  resource "textual-image" do
    url "https://files.pythonhosted.org/packages/40/e1/ad90ae431c615dd1ec5cdbf21ae573f8af68283619cf6c0f404e684d61ab/textual_image-0.8.2.tar.gz"
    sha256 "484fe6ab4a19cf243ea397dd34255092783231f3fbce91f50800faa5852254a0"
  end

  resource "textualeffects" do
    url "https://files.pythonhosted.org/packages/64/0e/8307b9349f79d42666e46e936d31d0224e47c8e9dac572c2585e0fa517eb/textualeffects-0.1.4.tar.gz"
    sha256 "86709321d49cd7abf47ed513782130174e6f5d85ea16996a7c38709c3646c463"
  end

  resource "typer" do
    url "https://files.pythonhosted.org/packages/6c/89/c527e6c848739be8ceb5c44eb8208c52ea3515c6cf6406aa61932887bf58/typer-0.15.4.tar.gz"
    sha256 "89507b104f9b6a0730354f27c39fae5b63ccd0c95b1ce1f1a6ba0cfd329997c3"
  end

  resource "typing-extensions" do
    url "https://files.pythonhosted.org/packages/d1/bc/51647cd02527e87d05cb083ccc402f93e441606ff1f01739a62c8ad09ba5/typing_extensions-4.14.0.tar.gz"
    sha256 "8676b788e32f02ab42d9e7c61324048ae4c6d844a399eebace3d4979d75ceef4"
  end

  resource "typing-inspection" do
    url "https://files.pythonhosted.org/packages/f8/b1/0c11f5058406b3af7609f121aaa6b609744687f1d158b3c3a5bf4cc94238/typing_inspection-0.4.1.tar.gz"
    sha256 "6ae134cc0203c33377d43188d4064e9b357dba58cff3185f22924610e70a9d28"
  end

  resource "uc-micro-py" do
    url "https://files.pythonhosted.org/packages/91/7a/146a99696aee0609e3712f2b44c6274566bc368dfe8375191278045186b8/uc-micro-py-1.0.3.tar.gz"
    sha256 "d321b92cff673ec58027c04015fcaa8bb1e005478643ff4a500882eaab88c48a"
  end

  resource "uvicorn" do
    url "https://files.pythonhosted.org/packages/de/ad/713be230bcda622eaa35c28f0d328c3675c371238470abdea52417f17a8e/uvicorn-0.34.3.tar.gz"
    sha256 "35919a9a979d7a59334b6b10e05d77c1d0d574c50e0fc98b8b1a0f165708b55a"
  end

  def install
    # `shellingham` auto-detection doesn't work in Homebrew CI build environment so
    # defer installation to allow `typer` to use argument as shell for completions
    # Ref: https://typer.tiangolo.com/features/#user-friendly-cli-apps
    venv = virtualenv_install_with_resources without: "shellingham"
    generate_completions_from_executable(bin/"oterm", "--show-completion")
    venv.pip_install resource("shellingham")
  end

  test do
    assert_match version.to_s, shell_output("#{bin}/oterm --version")
    assert_match "EnvConfig", shell_output("#{bin}/oterm --config")
  end
end
