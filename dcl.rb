require "formula"

# Documentation: https://github.com/Homebrew/homebrew/wiki/Formula-Cookbook
#                /usr/local/Library/Contributions/example-formula.rb
# PLEASE REMOVE ALL GENERATED COMMENTS BEFORE SUBMITTING YOUR PULL REQUEST!

class Dcl < Formula
  homepage "http://www.gfd-dennou.org/library/dcl/"
  url "http://www.gfd-dennou.org/library/dcl/dcl-5.4.8.tar.gz"
  sha1 "58aa1bd1226dbbb49e4d725cccdcac211cde94eb"
  version '5.4.8'

  depends_on 'pkg-config' => :build
  depends_on :x11
  depends_on 'glib'
  depends_on 'gtk+'
  depends_on 'atk'
  depends_on :fortran

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
