class Dcl < Formula
  desc ""
  homepage ""
  url "https://www.gfd-dennou.org/library/dcl/dcl-7.1.1.tar.gz"
  version "7.1.1"
  sha256 "57d8924d0c1245af239dee6abc1bbf82926dd86f1dd7ac3911b216cfc6a30e13"

  depends_on :fortran
  depends_on 'gtk+'

  def install
    ENV.deparallelize
    system "./configure", "--prefix=#{prefix}"
    system "make"
    system "install"
  end

  test do
    system "true"
  end
end
