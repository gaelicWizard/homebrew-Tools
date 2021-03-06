class GnustepMake < Formula
  desc "GNUstep is a mature Framework, suited both for advanced GUI desktop applications as well as server applications. The framework closely follows Apple's Cocoa APIs and is portable to a variety of platforms and architectures."
  homepage "http://gnustep.org"
  url "http://ftpmain.gnustep.org/pub/gnustep/core/gnustep-make-2.9.0.tar.gz"
  sha256 "a0b066c11257879c7c85311dea69c67f6dc741ef339db6514f85b64992c40d2a"
  license "GPL-3.0-or-later"

  revision 1
  head "https://github.com/gaelicWizard/GNUstep-make.git", branch: "macOS"

  livecheck do
    url "http://ftpmain.gnustep.org/pub/gnustep/core/"
    regex(/href=.*?gnustep-make[._-]v?(\d+(?:\.\d+)+)\.t/i)
  end

  bottle do
    sha256 cellar: :any_skip_relocation, arm64_big_sur: "f16315c14cfbdab197ea1562749d533ebbf19435b848a8173ae7c3ed08502968"
    sha256 cellar: :any_skip_relocation, big_sur: "b0a74dcdffdd9331348c0215f53967dcd4ecd9b2f8c2fdbdff32f27c288136af"
    sha256 cellar: :any_skip_relocation, catalina: "3fb00ffefe165c26880819f9d670468d5c874a055792a0a2b25ca47e4dcad43a"
    sha256 cellar: :any_skip_relocation, mojave: "449a586b8998cc6e5e45ffde3f518c5352cf5e31bd126b102d1597d4b76d6985"
    sha256 cellar: :any_skip_relocation, x86_64_linux: "f3fc8fa046eb3a370ecc6c263bba63257c570e9bad92bd2658fdea54c247f311"
  end

  option "without-strict", "Disable strict adherence to version 2 schema"
  option "without-arc", "Disable support for Automatic Reference Counting"
  option "without-strip", "Disable stripping comments from makefiles"

  option "with-import-config", "Import the system's existing configuration file"
  option "with-fhs", "Use GNUstep's `fhs-system` filesystem layout"

  option "with-gnu", "Use library combo `gnu-gnu-gnu`"

  def install
    inreplace "GNUmakefile.in", "override GNUSTEP_CONFIG_FILE", "GNUSTEP_CONFIG_FILE"

    args = [
      "--with-config-file=#{etc}/GNUstep.conf",
      "--enable-native-objc-exceptions"
    ]

    args << "--enable-strict-v2-mode" unless build.without? "strict"
    args << "--enable-strip-makefiles" unless build.without? "strip"
    args << "--disable-importing-config-file" unless build.with? "import-config"
    args << "--enable-flattened" unless build.without? "universal"
    args << "--disable-install-ld-so-conf" unless build.with? "ld-so-conf"
    args << "--enable-objc-arc" unless build.without? "arc"
    args << "--with-layout=fhs-system" if build.with? "fhs"
    args << "--with-layout=MacOS" if build.head?
    args << "--with-library-combo=apple-apple-apple" unless build.with? "gnu"
    args << "--with-user-defaults-dir=Library/Preferences" unless build.with? "gnu"
    args << "--with-library-combo=gnu-gnu-gnu" if build.with? "gnu"
    args << "GNUSTEP_MAKEFILES=#{share}/GNUstep/Makefiles"

    system "./configure",
            *args

    system "make",
           "install",
           "DESTDIR=#{prefix}",
           "makedir=#{share}/GNUstep/Makefiles",
           "tooldir=#{bin}",
           "mandir=#{man}",
           "GNUSTEP_CONFIG_FILE=#{prefix}/etc/GNUstep.conf"

    inreplace "#{prefix}/etc/GNUstep.conf",  /^GNUSTEP_MAKEFILES=.*$/, "GNUSTEP_MAKEFILES=\"#{opt_prefix}/share/GNUstep/Makefiles\""
    inreplace "#{share}/GNUstep/Makefiles/GNUstep.sh",  /^  GNUSTEP_MAKEFILES=.*$/, "  GNUSTEP_MAKEFILES=\"#{opt_prefix}/share/GNUstep/Makefiles\""
    inreplace "#{share}/GNUstep/Makefiles/GNUstep.csh", /^  setenv GNUSTEP_MAKEFILES \".*\"$/, "  setenv GNUSTEP_MAKEFILES \"#{opt_prefix}/share/GNUstep/Makefiles\""
    inreplace "#{bin}/gnustep-config",  /^  GNUSTEP_MAKEFILES=.*$/, "  GNUSTEP_MAKEFILES=\"#{opt_prefix}/share/GNUstep/Makefiles\""
    inreplace "#{bin}/openapp",  /^  GNUSTEP_MAKEFILES=\".*\"$/, "  GNUSTEP_MAKEFILES=\"#{opt_prefix}/share/GNUstep/Makefiles\""
    inreplace "#{bin}/opentool",  /^  GNUSTEP_MAKEFILES=.*$/, "  GNUSTEP_MAKEFILES=\"#{opt_prefix}/share/GNUstep/Makefiles\""
  end

  test do
    assert_match shell_output("#{bin}/gnustep-config --variable=CC").chomp, ENV.cc
  end
end
