class Dcl < Formula
  desc "This is a Fortran version of DCL, a drawing library useful for planetary and Earth sciences. This library includes graphical, character processing, and mathematical libraries."
  homepage ""
  url "https://dennou-k.gfd-dennou.org/library/dcl/dcl-7.5.2.tar.gz"
  version "7.5.2"
  sha256 "8cb9979064c0acf244a27035a7e2e40a555f20ff1cd3949a248138598ad90c58"
  license "BSD-2-Clause"

  depends_on 'gcc'
  depends_on 'gtk+3'
  depends_on 'pkg-config'

  def install
    ENV.deparallelize
    ENV["FCFLAGS"] = "-g -O2 -fallow-invalid-boz -std=legacy"
    ENV["FFLAGS"] = ENV["FCFLAGS"]
    system "./configure", "--prefix=#{prefix}", "--with-gtk3"
    system "make"
    system "make install"
  end

  test do
    system "true"
  end
end
