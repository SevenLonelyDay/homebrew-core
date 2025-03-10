class Iguana < Formula
  desc "Universal serialization engine"
  homepage "https://github.com/qicosmos/iguana"
  url "https://github.com/qicosmos/iguana/archive/refs/tags/1.0.8.tar.gz"
  sha256 "d73da8c876a060781ccf56ec79a6984dadefc7a6b00820365edf0d4ce71b822d"
  license "Apache-2.0"
  head "https://github.com/qicosmos/iguana.git", branch: "master"

  bottle do
    sha256 cellar: :any_skip_relocation, all: "432724e0049958a5e03b6b55f68d751b8215290f2bd6b3d24805600baeed2298"
  end

  depends_on "frozen"

  def install
    include.install "iguana"
  end

  test do
    (testpath/"test.cpp").write <<~CPP
      #include <iguana/json_writer.hpp>
      #include <string>
      #include <iostream>
      struct person
      {
        std::string  name;
        int          age;
      };
      auto main() -> int {
        person p = { "tom", 28 };
        std::string ss;
        iguana::to_json(p, ss);
        std::cout << ss << std::endl;
      }
    CPP
    system ENV.cxx, "test.cpp", "-std=c++20", "-L#{lib}", "-o", "test"
    assert_equal "{\"name\":\"tom\",\"age\":28}", shell_output("./test").chomp
  end
end
