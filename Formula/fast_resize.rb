class FastResize < Formula
  desc "The fastest image resizing library on the planet."
  homepage "https://github.com/tranhuucanh/fast_resize"
  version "1.0.5"
  url "https://github.com/tranhuucanh/fast_resize/releases/download/v1.0.5/fast_resize-1.0.5.tar.gz"
  sha256 "461bdf3c1b03b834f3e6aa55f9d38cda847aa50b722899df6f614cecaa54941b"
  license "BSD-3-Clause"

  depends_on "cmake" => :build
  depends_on "pkg-config" => :build
  depends_on "jpeg-turbo"
  depends_on "libpng"
  depends_on "webp"

  def install
    system "cmake", "-S", ".", "-B", "build",
                    "-DCMAKE_BUILD_TYPE=Release",
                    "-DBUILD_SHARED_LIBS=OFF",
                    "-DFASTRESIZE_STATIC=ON",
                    "-DFASTRESIZE_BUILD_TESTS=OFF",
                    "-DFASTRESIZE_BUILD_EXAMPLES=OFF",
                    "-DFASTRESIZE_BUILD_BENCHMARKS=OFF",
                    *std_cmake_args
    system "cmake", "--build", "build"
    system "cmake", "--install", "build"
  end

  test do
    (testpath/"test.cpp").write <<~EOS
      #include <fastresize.h>
      int main() {
        // Test that we can include the header
        fastresize::ResizeOptions opts;
        return 0;
      }
    EOS

    system ENV.cxx, "test.cpp",
           "-I#{include}",
           "-L#{lib}",
           "-lfastresize",
           "-std=c++14",
           "-o", "test"
    system "./test"
  end
end
