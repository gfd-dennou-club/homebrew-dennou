require "formula"

# Documentation: https://github.com/Homebrew/homebrew/wiki/Formula-Cookbook
#                /usr/local/Library/Contributions/example-formula.rb
# PLEASE REMOVE ALL GENERATED COMMENTS BEFORE SUBMITTING YOUR PULL REQUEST!

class Dcl < Formula
  homepage "http://www.gfd-dennou.org/library/dcl/"
  url "http://www.gfd-dennou.org/library/dcl/dcl-5.4.8.tar.gz"
  sha1 "58aa1bd1226dbbb49e4d725cccdcac211cde94eb"
  version '5.4.8'

  depends_on :x11
  depends_on 'gtkx'
  depends_on :fortran

  def install
    ENV.deparallelize

    system "./configure", "--enable-shared",
                          "--prefix=#{prefix}"
    system "make"
    system "make install"
  end

  test do
    system "false"
  end
end
