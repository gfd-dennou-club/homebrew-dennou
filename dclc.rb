require "formula"

# Documentation: https://github.com/Homebrew/homebrew/wiki/Formula-Cookbook
#                /usr/local/Library/Contributions/example-formula.rb
# PLEASE REMOVE ALL GENERATED COMMENTS BEFORE SUBMITTING YOUR PULL REQUEST!

class Dclc < Formula
  homepage ""
  url "http://www.gfd-dennou.org/arch/dcl/dcl-5.9.0-C.tar.gz"
  sha1 "75c2359d7aaa472365af46401abd031445646ffe"
  version '5.9.0'


  depends_on 'pkg-config' => :build
  depends_on :x11
  depends_on 'glib'
  depends_on 'gtk+'
  depends_on 'atk'

  def install
    # ENV.deparallelize  # if your formula fails when building in parallel

    # Remove unrecognized options if warned by configure
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
