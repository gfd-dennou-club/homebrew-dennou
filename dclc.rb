class Dclc < Formula
  desc ""
  homepage ""
  url "https://www.gfd-dennou.org/library/dcl/dcl-7.1.1-C.tar.gz"
  version "7.1.1"
  sha256 "5d7e684c0de5d70730a549da6173112ad6d9c0ffffd958ce313685858f59dc1d"

  depends_on 'gtk+'

  def install
    ENV.deparallelize
    system "./configure", "--prefix=#{prefix}"
    system "make"
    system "make install"
  end

  test do
    system "true"
  end
end
