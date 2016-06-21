class Halide < Formula
  desc "The Halide image processing language"
  homepage "http://halide-lang.org"
  url "https://github.com/halide/Halide/releases/download/release_2016_04_27/halide-mac-64-trunk-2f11b9fce62f596e832907b82d87e8f75c53dd07.tgz"
  version "2016.04.27"
  sha256 "7304e1b8638e7529dcc38d3e7f1ac40b065cc912fa793f45ec0f1b13210d817c"

  def install
    lib.install Dir['bin/libHalide*']
    include.install Dir['include/*']
    system "mkdir", "halide"
    system "mv", "tools", "halide/"
    system "mv", "tutorial", "halide/"
    share.install 'halide'
  end

  test do
    system "g++", "#{share}/halide/tutorial/lesson_01_basics.cpp", "-g", "-I", "#{include}", "-L", "#{lib}", "-lHalide", "-o", "lesson_01", "-std=c++11"
    system "./lesson_01"
  end
end
