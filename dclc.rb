require "formula"

class Dclc < Formula
  homepage ""
  url "https://www.gfd-dennou.org/library/dcl/dcl-6.0.2-C.tar.gz"
  sha1 "d4446ca51cd08eb19fcbfeb083dc7deae41b5ec4"
  version '6.0.2'

  depends_on 'pkg-config' => :build
  depends_on :x11
  depends_on 'glib'
  depends_on 'gtk+'
  depends_on 'atk'

  def install
    system "./configure", "--prefix=#{prefix}",
                          "--x-includes=/opt/X11/include",
                          "--x-libraries=/opt/X11/lib"
    system "make"
    system "make install"
  end

  test do
    system "false"
  end
end
