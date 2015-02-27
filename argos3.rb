require "formula"

class Argos3 < Formula
  homepage "http://iridia.ulb.ac.be/argos/"
  url "https://github.com/ilpincy/argos3/archive/3.0.0-beta30.tar.gz"
  sha1 "0e357527e5cb09822a8d3e164fde384d99b6dbc9"
  version "3.0.0-beta30"
  head "https://github.com/ilpincy/argos3.git"

  option 'without-qt', 'Compile without the Qt-OpenGL visualization'

  depends_on "pkg-config" => :build
  depends_on "cmake" => :build
  depends_on "docbook" => :build
  depends_on "asciidoc" => :build
  depends_on "graphviz" => :build
  depends_on "doxygen" => :build
  depends_on "gsl"
  depends_on "libpng"
  depends_on "freeimage"
  depends_on "lua" => :recommended
  depends_on "qt" => :recommended
  depends_on "bash-completion" => :recommended

  def install
    mkdir "build_simulator"
    cd "build_simulator"
    system "cmake", "../src", "-DCMAKE_BUILD_TYPE=Release", "-DCMAKE_INSTALL_PREFIX=#{prefix}", "-DARGOS_BUILD_NATIVE=ON"
    system "make"
    system "make doc"
    system "make install"
  end

  test do
    system "argos3 -q all"
  end
end
