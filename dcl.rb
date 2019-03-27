class Dcl < Formula
  desc "This is a Fortran version of DCL, a drawing library useful for planetary and Earth sciences. This library includes graphical, character processing, and mathematical libraries."
  homepage ""
  url "http://www.gfd-dennou.org/library/dcl/dcl-7.3.4.tar.gz"
  version "7.3.4"
  sha256 "5f38d8206f3f473321dca3717bc060921c5360ed5d47403b50677c847c439f93"

  depends_on 'gcc'
  depends_on 'gtk+'
  depends_on 'pkg-config'

  def install
    ENV.deparallelize
    system "./configure", "--prefix=#{prefix}", "--with-gtk2"
    system "make"
    system "make install"
  end

  test do
    system "true"
  end
end
