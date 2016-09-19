class Gtool5 < Formula
  desc ""
  homepage ""
  url "https://www.gfd-dennou.org/library/gtool/gtool5/gtool5-20160613.tgz"
  version "20160613"
  sha256 "10824135382ab4efb7b92cb3206243956a1aaa8bd5e94443c84fd46a453302f8"

  depends_on :fortran
  depends_on 'netcdf' => 'with-fortran'

  def install
    ENV.deparallelize
    if ENV['SYSFFLAGS'].nil?
      ENV.append 'FCFLAGS', '-I/usr/local/include'
      ENV['SYSFFLAGS'] = ENV['FCFLAGS']
    end
    system "./configure", "--with-netcdff=/usr/local/lib/libnetcdff.a",
                          "--with-netcdf=/usr/local/lib/libnetcdf.a",
                          "--prefix=#{prefix}"
    system "make"
    system "make test"
    system "make install"
  end

  def caveats; <<-EOS.undent
    This gtool5 library build with following FLAGS:
      CFLAGS:  #{ENV['CFLAGS']}
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
