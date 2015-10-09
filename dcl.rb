require "formula"

class Dcl < Formula
  homepage "http://www.gfd-dennou.org/library/dcl/"
  url "http://www.gfd-dennou.org/library/dcl/dcl-6.0.2.tar.gz"
  sha1 "2e7e27da33cbe2d6bcb76ec5550f4c6dc20a1c95"
  version '6.0.2'

  # gfortran, enable OpenMP
  depends_on :fortran => "without-multilib"
  # for gtk support
  depends_on :x11
  depends_on 'pkg-config'
  depends_on 'glib'
  depends_on 'gtk+'
  depends_on 'atk'

  def install
    ENV.deparallelize
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
