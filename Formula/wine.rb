# NOTE: When updating Wine, please make sure to match Wine-Gecko and Wine-Mono
# versions:
#  - https://wiki.winehq.org/Gecko
#  - https://wiki.winehq.org/Mono
# with `GECKO_VERSION` and `MONO_VERSION`, as in:
#    https://source.winehq.org/git/wine.git/blob/refs/tags/wine-3.0:/dlls/appwiz.cpl/addons.c
class Wine < Formula
  desc "Run Windows applications without a copy of Microsoft Windows"
  homepage "https://www.winehq.org/"
  revision 1

  stable do
    url "https://dl.winehq.org/wine/source/3.0/wine-3.0.tar.xz"
    mirror "https://downloads.sourceforge.net/project/wine/Source/wine-3.0.tar.xz"
    sha256 "346a050aca5cd0d9978a655af11c30e68c201a58aea0c70d5e4c4f1b63c2fbec"

    # Patch to fix screen-flickering issues. Still relevant on 3.0.
    # https://bugs.winehq.org/show_bug.cgi?id=34166
    patch do
      url "https://raw.githubusercontent.com/Homebrew/formula-patches/74c2566/wine/2.14.patch"
      sha256 "6907471d18996ada60cc0cbc8462a1698e90720c0882846dfbfb163e5d3899b8"
    end

    resource "mono" do
      url "https://dl.winehq.org/wine/wine-mono/4.7.1/wine-mono-4.7.1.msi", :using => :nounzip
      sha256 "2c8d5db7f833c3413b2519991f5af1f433d59a927564ec6f38a3f1f8b2c629aa"
    end
  end

  bottle do
    sha256 "bf84c0a02b7d7b4fc8814891f5542c0e35c30c922e0d2bcf4af168a1f34e36e4" => :high_sierra
    sha256 "cceea27c906e9e5e7916281a57c36872c943802e998fede387fa7ccbc9d297ac" => :sierra
    sha256 "309e0b2978bb79ea627caba23d7f3bbb0cb54d3a6b08836b2cde387a743dae50" => :el_capitan
  end

  devel do
    url "https://dl.winehq.org/wine/source/3.x/wine-3.6.tar.xz"
    mirror "https://downloads.sourceforge.net/project/wine/Source/wine-3.6.tar.xz"
    sha256 "78502dc79a60430d2a2ef66bee146e38eb6dd679fd36b54acfc8f9b2ac07905c"

    resource "mono" do
      url "https://dl.winehq.org/wine/wine-mono/4.7.1/wine-mono-4.7.1.msi", :using => :nounzip
      sha256 "2c8d5db7f833c3413b2519991f5af1f433d59a927564ec6f38a3f1f8b2c629aa"
    end
  end

  head do
    url "https://source.winehq.org/git/wine.git"

    resource "mono" do
      url "https://dl.winehq.org/wine/wine-mono/4.7.1/wine-mono-4.7.1.msi", :using => :nounzip
      sha256 "2c8d5db7f833c3413b2519991f5af1f433d59a927564ec6f38a3f1f8b2c629aa"
    end
  end

  depends_on :macos => :el_capitan
  depends_on "pkg-config" => :build
  depends_on "cmake" => :build
  depends_on "makedepend" => :build

  resource "gecko-x86" do
    url "https://dl.winehq.org/wine/wine-gecko/2.47/wine_gecko-2.47-x86.msi", :using => :nounzip
    sha256 "3b8a361f5d63952d21caafd74e849a774994822fb96c5922b01d554f1677643a"
  end

  resource "gecko-x86_64" do
    url "https://dl.winehq.org/wine/wine-gecko/2.47/wine_gecko-2.47-x86_64.msi", :using => :nounzip
    sha256 "c565ea25e50ea953937d4ab01299e4306da4a556946327d253ea9b28357e4a7d"
  end

  resource "openssl" do
    url "https://www.openssl.org/source/openssl-1.0.2o.tar.gz"
    mirror "https://dl.bintray.com/homebrew/mirror/openssl-1.0.2o.tar.gz"
    sha256 "ec3f5c9714ba0fd45cb4e087301eb1336c317e0d20b575a125050470e8089e4d"
  end

  resource "libtool" do
    url "https://ftp.gnu.org/gnu/libtool/libtool-2.4.6.tar.xz"
    mirror "https://ftpmirror.gnu.org/libtool/libtool-2.4.6.tar.xz"
    sha256 "7c87a8c2c8c0fc9cd5019e402bed4292462d00a718a7cd5f11218153bf28b26f"
  end

  resource "jpeg" do
    url "http://www.ijg.org/files/jpegsrc.v9c.tar.gz"
    mirror "https://fossies.org/linux/misc/jpegsrc.v9c.tar.gz"
    sha256 "650250979303a649e21f87b5ccd02672af1ea6954b911342ea491f351ceb7122"
  end

  resource "libtiff" do
    url "https://download.osgeo.org/libtiff/tiff-4.0.9.tar.gz"
    mirror "https://fossies.org/linux/misc/tiff-4.0.9.tar.gz"
    sha256 "6e7bdeec2c310734e734d19aae3a71ebe37a4d842e0e23dbb1b8921c0026cfcd"
  end

  resource "little-cms2" do
    url "https://downloads.sourceforge.net/project/lcms/lcms/2.9/lcms2-2.9.tar.gz"
    mirror "https://mirrors.kernel.org/debian/pool/main/l/lcms2/lcms2_2.9.orig.tar.gz"
    sha256 "48c6fdf98396fa245ed86e622028caf49b96fa22f3e5734f853f806fbc8e7d20"
  end

  resource "libpng" do
    url "https://downloads.sourceforge.net/libpng/libpng-1.6.34.tar.xz"
    mirror "https://sourceforge.mirrorservice.org/l/li/libpng/libpng16/1.6.34/libpng-1.6.34.tar.xz"
    sha256 "2f1e960d92ce3b3abd03d06dfec9637dfbd22febf107a536b44f7a47c60659f6"
  end

  resource "freetype" do
    url "https://downloads.sourceforge.net/project/freetype/freetype2/2.9/freetype-2.9.tar.bz2"
    mirror "https://download.savannah.gnu.org/releases/freetype/freetype-2.9.tar.bz2"
    sha256 "e6ffba3c8cef93f557d1f767d7bc3dee860ac7a3aaff588a521e081bc36f4c8a"
  end

  resource "libusb" do
    url "https://github.com/libusb/libusb/releases/download/v1.0.22/libusb-1.0.22.tar.bz2"
    mirror "https://downloads.sourceforge.net/project/libusb/libusb-1.0/libusb-1.0.22/libusb-1.0.22.tar.bz2"
    sha256 "75aeb9d59a4fdb800d329a545c2e6799f732362193b465ea198f2aa275518157"
  end

  resource "webp" do
    url "https://storage.googleapis.com/downloads.webmproject.org/releases/webp/libwebp-0.6.1.tar.gz"
    sha256 "06503c782d9f151baa325591c3579c68ed700ffc62d4f5a32feead0ff017d8ab"
  end

  resource "fontconfig" do
    url "https://www.freedesktop.org/software/fontconfig/release/fontconfig-2.12.6.tar.bz2"
    mirror "https://ftp.osuosl.org/pub/blfs/conglomeration/fontconfig/fontconfig-2.12.6.tar.bz2"
    sha256 "cf0c30807d08f6a28ab46c61b8dbd55c97d2f292cf88f3a07d3384687f31f017"
  end

  resource "gd" do
    url "https://github.com/libgd/libgd/releases/download/gd-2.2.5/libgd-2.2.5.tar.xz"
    mirror "https://src.fedoraproject.org/repo/pkgs/gd/libgd-2.2.5.tar.xz/sha512/946675b0a9dbecdee3dda927d496a35d6b5b071d3252a82cd649db0d959a82fcc65ce067ec34d07eed0e0497cd92cc0d93803609a4854f42d284e950764044d0/libgd-2.2.5.tar.xz"
    sha256 "8c302ccbf467faec732f0741a859eef4ecae22fea2d2ab87467be940842bde51"
  end

  resource "libgphoto2" do
    url "https://downloads.sourceforge.net/project/gphoto/libgphoto/2.5.16/libgphoto2-2.5.16.tar.bz2"
    mirror "https://fossies.org/linux/privat/libgphoto2-2.5.16.tar.bz2"
    sha256 "e757416d1623e01a9d0d294b2e790162e434c0964f50d3b7ff1a3424b62a2906"
  end

  resource "net-snmp" do
    url "https://downloads.sourceforge.net/project/net-snmp/net-snmp/5.7.3/net-snmp-5.7.3.tar.gz"
    sha256 "12ef89613c7707dc96d13335f153c1921efc9d61d3708ef09f3fc4a7014fb4f0"
  end

  resource "sane-backends" do
    url "https://alioth.debian.org/frs/download.php/file/4224/sane-backends-1.0.27.tar.gz"
    mirror "https://mirrors.kernel.org/debian/pool/main/s/sane-backends/sane-backends_1.0.27.orig.tar.gz"
    mirror "https://fossies.org/linux/misc/sane-backends-1.0.27.tar.gz"
    sha256 "293747bf37275c424ebb2c833f8588601a60b2f9653945d5a3194875355e36c9"
  end

  resource "mpg123" do
    url "https://downloads.sourceforge.net/project/mpg123/mpg123/1.25.10/mpg123-1.25.10.tar.bz2"
    mirror "https://www.mpg123.de/download/mpg123-1.25.10.tar.bz2"
    sha256 "6c1337aee2e4bf993299851c70b7db11faec785303cfca3a5c3eb5f329ba7023"
  end

  fails_with :clang do
    build 425
    cause "Clang prior to Xcode 5 miscompiles some parts of wine"
  end

  def openssl_arch_args
    {
      :x86_64 => %w[darwin64-x86_64-cc enable-ec_nistp_64_gcc_128],
      :i386 => %w[darwin-i386-cc],
    }
  end

  # Store and restore some of our environment
  def save_env
    saved_cflags = ENV["CFLAGS"]
    saved_ldflags = ENV["LDFLAGS"]
    saved_homebrew_archflags = ENV["HOMEBREW_ARCHFLAGS"]
    saved_homebrew_cccfg = ENV["HOMEBREW_CCCFG"]
    saved_makeflags = ENV["MAKEFLAGS"]
    saved_homebrew_optflags = ENV["HOMEBREW_OPTFLAGS"]
    begin
      yield
    ensure
      ENV["CFLAGS"] = saved_cflags
      ENV["LDFLAGS"] = saved_ldflags
      ENV["HOMEBREW_ARCHFLAGS"] = saved_homebrew_archflags
      ENV["HOMEBREW_CCCFG"] = saved_homebrew_cccfg
      ENV["MAKEFLAGS"] = saved_makeflags
      ENV["HOMEBREW_OPTFLAGS"] = saved_homebrew_optflags
    end
  end

  def install
    ENV.prepend_create_path "PATH", "#{libexec}/bin"
    ENV.prepend_create_path "PKG_CONFIG_PATH", "#{libexec}/lib/pkgconfig"

    resource("openssl").stage do
      save_env do
        ENV.deparallelize
        ENV.permit_arch_flags

        # OpenSSL will prefer the PERL environment variable if set over $PATH
        # which can cause some odd edge cases & isn't intended. Unset for safety,
        # along with perl modules in PERL5LIB.
        ENV.delete("PERL")
        ENV.delete("PERL5LIB")

        archs = Hardware::CPU.universal_archs

        dirs = []
        archs.each do |arch|
          dir = "build-#{arch}"
          dirs << dir
          mkdir_p "#{dir}/engines"
          system "make", "clean"
          system "perl", "./Configure", "--prefix=#{libexec}",
                                        "no-ssl2",
                                        "no-zlib",
                                        "shared",
                                        "enable-cms",
                                        *openssl_arch_args[arch]
          system "make", "depend"
          system "make"
          cp "include/openssl/opensslconf.h", dir
          cp Dir["*.?.?.?.dylib", "*.a", "apps/openssl"], dir
          cp Dir["engines/**/*.dylib"], "#{dir}/engines"
        end

        system "make", "install"

        %w[libcrypto libssl].each do |libname|
          rm_f libexec/"lib/#{libname}.1.0.0.dylib"
          MachO::Tools.merge_machos("#{libexec}/lib/#{libname}.1.0.0.dylib",
                                    "#{dirs.first}/#{libname}.1.0.0.dylib",
                                    "#{dirs.last}/#{libname}.1.0.0.dylib")
          rm_f libexec/"lib/#{libname}.a"
        end

        Dir.glob("#{dirs.first}/engines/*.dylib") do |engine|
          libname = File.basename(engine)
          rm_f libexec/"lib/engines/#{libname}"
          MachO::Tools.merge_machos("#{libexec}/lib/engines/#{libname}",
                                    "#{dirs.first}/engines/#{libname}",
                                    "#{dirs.last}/engines/#{libname}")
        end

        MachO::Tools.merge_machos("#{libexec}/bin/openssl",
                                  "#{dirs.first}/openssl",
                                  "#{dirs.last}/openssl")

        confs = archs.map do |arch|
          <<~EOS
            #ifdef __#{arch}__
            #{(Pathname.pwd/"build-#{arch}/opensslconf.h").read}
            #endif
            EOS
        end
        (libexec/"include/openssl/opensslconf.h").atomic_write confs.join("\n")
      end
    end

    depflags = ["CPPFLAGS=-I#{libexec}/include", "LDFLAGS=-L#{libexec}/lib"]

    # All other resources use ENV.universal_binary
    save_env do
      ENV.universal_binary

      resource("libtool").stage do
        ENV["SED"] = "sed" # prevent libtool from hardcoding sed path from superenv
        system "./configure", "--disable-dependency-tracking",
                              "--prefix=#{libexec}",
                              "--disable-static",
                              "--program-prefix=g",
                              "--enable-ltdl-install"
        system "make", "install"
      end

      resource("jpeg").stage do
        system "./configure", "--disable-dependency-tracking",
                              "--prefix=#{libexec}",
                              "--disable-static"
        system "make", "install"
      end

      resource("libtiff").stage do
        system "./configure", "--disable-dependency-tracking",
                              "--prefix=#{libexec}",
                              "--disable-static",
                              "--disable-lzma",
                              "--without-x",
                              "--with-jpeg-lib-dir=#{libexec}/lib",
                              "--with-jpeg-include-dir=#{libexec}/include"
        system "make", "install"
      end

      resource("little-cms2").stage do
        system "./configure", "--disable-dependency-tracking",
                              "--prefix=#{libexec}",
                              "--disable-static",
                              "--with-jpeg=#{libexec}",
                              "--with-tiff=#{libexec}"
        system "make", "install"
      end

      resource("libpng").stage do
        system "./configure", "--disable-dependency-tracking",
                              "--prefix=#{libexec}",
                              "--disable-static"
        system "make", "install"
      end

      resource("freetype").stage do
        # Enable sub-pixel rendering
        inreplace "include/freetype/config/ftoption.h",
                  "/* #define FT_CONFIG_OPTION_SUBPIXEL_RENDERING */",
                  "#define FT_CONFIG_OPTION_SUBPIXEL_RENDERING"

        system "./configure", "--prefix=#{libexec}",
                              "--disable-static",
                              "--without-harfbuzz",
                              *depflags
        system "make", "install"
      end

      resource("libusb").stage do
        system "./configure", "--disable-dependency-tracking",
                              "--prefix=#{libexec}",
                              "--disable-static"
        system "make", "install"
      end

      resource("webp").stage do
        system "./configure", "--disable-dependency-tracking",
                              "--prefix=#{libexec}",
                              "--disable-static",
                              "--disable-gl",
                              "--enable-libwebpmux",
                              "--enable-libwebpdemux",
                              "--enable-libwebpdecoder",
                              *depflags
        system "make", "install"
      end

      resource("fontconfig").stage do
        system "./configure", "--disable-dependency-tracking",
                              "--prefix=#{libexec}",
                              "--disable-static",
                              "--with-add-fonts=/System/Library/Fonts,/Library/Fonts,~/Library/Fonts",
                              "--localstatedir=#{var}/vendored_wine_fontconfig",
                              "--sysconfdir=#{prefix}",
                              *depflags
        system "make", "install", "RUN_FC_CACHE_TEST=false"
      end

      resource("gd").stage do
        system "./configure", "--disable-dependency-tracking",
                              "--prefix=#{libexec}",
                              "--disable-static",
                              "--without-x",
                              "--without-xpm",
                              "--with-png=#{libexec}",
                              "--with-fontconfig=#{libexec}",
                              "--with-freetype=#{libexec}",
                              "--with-jpeg=#{libexec}",
                              "--with-tiff=#{libexec}",
                              "--with-webp=#{libexec}"
        system "make", "install"
      end

      resource("libgphoto2").stage do
        system "./configure", "--disable-dependency-tracking",
                              "--prefix=#{libexec}",
                              *depflags
        system "make", "install"
      end

      resource("net-snmp").stage do
        # https://sourceforge.net/p/net-snmp/bugs/2504/
        ln_s "darwin13.h", "include/net-snmp/system/darwin14.h"
        ln_s "darwin13.h", "include/net-snmp/system/darwin15.h"
        ln_s "darwin13.h", "include/net-snmp/system/darwin16.h"
        ln_s "darwin13.h", "include/net-snmp/system/darwin17.h"

        system "./configure", "--disable-debugging",
                              "--prefix=#{libexec}",
                              "--disable-static",
                              "--enable-ipv6",
                              "--with-defaults",
                              "--with-persistent-directory=#{var}/db/net-snmp_vendored_wine",
                              "--with-logfile=#{var}/log/snmpd_vendored_wine.log",
                              "--with-mib-modules=host\ ucd-snmp/diskio",
                              "--without-rpm",
                              "--without-kmem-usage",
                              "--disable-embedded-perl",
                              "--without-perl-modules",
                              "--with-openssl=#{libexec}",
                              *depflags
        system "make"
        system "make", "install"
      end

      resource("sane-backends").stage do
        save_env do
          system "./configure", "--disable-dependency-tracking",
                                "--prefix=#{libexec}",
                                "--localstatedir=#{var}",
                                "--without-gphoto2",
                                "--enable-local-backends",
                                "--with-usb=yes",
                                *depflags
          # Remove for > 1.0.27
          # Workaround for bug in Makefile.am described here:
          # https://lists.alioth.debian.org/pipermail/sane-devel/2017-August/035576.html.
          # Fixed in https://anonscm.debian.org/cgit/sane/sane-backends.git/commit/?id=519ff57
          system "make"
          system "make", "install"
        end
      end

      resource("mpg123").stage do
        system "./configure", "--disable-debug",
                              "--disable-dependency-tracking",
                              "--prefix=#{libexec}",
                              "--with-default-audio=coreaudio",
                              "--with-module-suffix=.so",
                              "--with-cpu=generic"
        system "make", "install"
      end
    end

    # Help wine find our libraries at runtime
    %w[freetype jpeg png sane tiff].each do |dep|
      ENV["ac_cv_lib_soname_#{dep}"] = (libexec/"lib/lib#{dep}.dylib").realpath
    end

    mkdir "wine-64-build" do
      system "../configure", "--prefix=#{prefix}",
                             "--enable-win64",
                             "--without-x",
                             *depflags
      system "make", "install"
    end

    mkdir "wine-32-build" do
      ENV.m32
      system "../configure", "--prefix=#{prefix}",
                             "--with-wine64=../wine-64-build",
                             "--without-x",
                             *depflags
      system "make", "install"
    end
    (pkgshare/"gecko").install resource("gecko-x86")
    (pkgshare/"gecko").install resource("gecko-x86_64")
    (pkgshare/"mono").install resource("mono")
  end

  def post_install
    # For fontconfig
    ohai "Regenerating font cache, this may take a while"
    system "#{libexec}/bin/fc-cache", "-frv"

    # For net-snmp
    (var/"db/net-snmp_vendored_wine").mkpath
    (var/"log").mkpath
  end

  def caveats; <<~EOS
    You may also want winetricks:
      brew install winetricks
    EOS
  end

  test do
    assert_equal shell_output("hostname").chomp, shell_output("#{bin}/wine hostname.exe 2>/dev/null").chomp
    assert_equal shell_output("hostname").chomp, shell_output("#{bin}/wine64 hostname.exe 2>/dev/null").chomp
  end
end
