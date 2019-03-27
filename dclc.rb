class Dclc < Formula
  desc "This is a C version of DCL, a drawing library useful for planetary and Earth sciences. This library includes graphical, character processing, and mathematical libraries."
  homepage "http://www.gfd-dennou.org/library/dcl/"
  url "http://www.gfd-dennou.org/library/dcl/dcl-7.3.4-C.tar.gz"
  version "7.3.4"
  sha256 "68bfb3984130f3084986000465a2493f32ffb6b996eaf6927b74efbcd6d34a3d"

  depends_on 'gtk+'
  depends_on 'pkg-config'
  depends_on 'dcl'

  def install
    ENV.deparallelize
    system "./configure", "--prefix=#{prefix}", "--with-gtk2"
    system "make"
    system "make install"
    dclbasedir = `dclconfig --dbasedir`.chomp
    system "ln -s #{dclbasedir}/bitmap.x11 #{prefix}/lib/cdcldbase/."
  end

  test do
    system "true"
  end
end
