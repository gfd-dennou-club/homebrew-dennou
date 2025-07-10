class Gtool5 < Formula
  desc ""
  homepage ""
  url "https://www.gfd-dennou.org/library/gtool/gtool5/gtool5-20160613.tgz"
  version "20160613"
  sha256 "10824135382ab4efb7b92cb3206243956a1aaa8bd5e94443c84fd46a453302f8"

  depends_on 'gcc'
  depends_on 'netcdf' => 'with-fortran'

  def install
    brew_prefix = `/usr/local/bin/brew --prefix`.chomp!
    ENV.deparallelize
    if ENV['SYSFFLAGS'].nil?
      ENV.append 'SYSFFLAGS', "-I#{brew_prefix}/include"
    else
      ENV['SYSFFLAGS'] = "-I#{brew_prefix}/include"
    end
    ENV.append 'FC', "gfortran"
    system "./configure", "--with-netcdf-include=#{brew_prefix}/include/netcdf.inc",
                          "--with-netcdff=#{brew_prefix}/lib/libnetcdff.a",
                          "--with-netcdf=#{brew_prefix}/lib/libnetcdf.a",
                          "--prefix=#{prefix}"
    system "make"
    system "make test"
    system "make install"
  end

  def caveats; <<~EOS
    This gtool5 library build with following FLAGS:
      FFLAGS:  #{ENV['SYSFFLAGS']}

    If you want set Compiler FLAGS such as '-O2', please set 'SYSFFLAGS', 
    and reinstall this libraray, e.g.:
       % SYSFFLAGS='what you want' brew install --force gtool5

    Note: please check your NetCDF, HDF5 FLAGS.                    enjoy!
    EOS
  end

  test do
    system "false"
  end
end
