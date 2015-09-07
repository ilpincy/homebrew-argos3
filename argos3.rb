require "formula"

class Argos3 < Formula
  VERSION_MAJOR   = "3"
  VERSION_MINOR   = "0"
  VERSION_PATCH   = "0"
  VERSION_RELEASE = "beta38"
  VERSION_FULL    = "#{VERSION_MAJOR}.#{VERSION_MINOR}.#{VERSION_PATCH}-#{VERSION_RELEASE}"
  
  homepage "http://www.argos-sim.info/"
  url "https://github.com/ilpincy/argos3/archive/#{VERSION_FULL}.tar.gz"
  sha1 "10944b8d93ce3891173cc4c1fbb4c1ca8b4d16a0"
  version VERSION_FULL
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
  depends_on "lua"
  depends_on "qt" => :recommended
  depends_on "bash-completion" => :recommended

  def install
    mkdir "build_simulator"
    cd "build_simulator"
    system "cmake", "../src", "-DCMAKE_BUILD_TYPE=Release", "-DCMAKE_INSTALL_PREFIX=#{prefix}", "-DARGOS_BUILD_NATIVE=ON", "-DCPACK_PACKAGE_VERSION_MAJOR=#{VERSION_MAJOR}", "-DCPACK_PACKAGE_VERSION_MINOR=#{VERSION_MINOR}", "-DCPACK_PACKAGE_VERSION_PATCH=#{VERSION_PATCH}", "-DCPACK_PACKAGE_RELEASE=#{VERSION_RELEASE}"
    system "make"
    system "make doc"
    system "make install"
  end

  test do
    system "argos3 -q all"
  end
end
