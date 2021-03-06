require "formula"

class Argos3 < Formula
  VERSION_MAJOR   = "3"
  VERSION_MINOR   = "0"
  VERSION_PATCH   = "0"
  VERSION_RELEASE = "beta56"
  VERSION_FULL    = "#{VERSION_MAJOR}.#{VERSION_MINOR}.#{VERSION_PATCH}-#{VERSION_RELEASE}"
  
  homepage "http://www.argos-sim.info/"
  url "https://github.com/ilpincy/argos3/archive/#{VERSION_FULL}.tar.gz"
  sha256 "246516999fd283fc751f0548ec109bbe37e16c76730af68010c0145fa34f9576"
  version VERSION_FULL
  head "https://github.com/ilpincy/argos3.git"

  depends_on "pkg-config" => :build
  depends_on "cmake" => :build
  depends_on "docbook" => :build
  depends_on "asciidoc" => :build
  depends_on "graphviz" => :build
  depends_on "doxygen" => :build
  depends_on "qt"
  depends_on "libpng"
  depends_on "freeimage"
  depends_on "lua"
  depends_on "bash-completion" => :recommended

  def install
    mkdir "build_simulator"
    cd "build_simulator"
    system "cmake", "../src", "-DCMAKE_BUILD_TYPE=Release", "-DCMAKE_INSTALL_PREFIX=#{prefix}", "-DARGOS_BUILD_NATIVE=ON", "-DCPACK_PACKAGE_VERSION_MAJOR=#{VERSION_MAJOR}", "-DCPACK_PACKAGE_VERSION_MINOR=#{VERSION_MINOR}", "-DCPACK_PACKAGE_VERSION_PATCH=#{VERSION_PATCH}", "-DCPACK_PACKAGE_RELEASE=#{VERSION_RELEASE}", "-DARGOS_BREW_QT_CELLAR=#{HOMEBREW_PREFIX}/Cellar/qt"
    system "make"
    system "make doc"
    system "make install"
  end

  test do
    system "argos3 -q all"
  end
end
