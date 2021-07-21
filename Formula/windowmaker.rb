# Documentation: https://docs.brew.sh/Formula-Cookbook
#                https://rubydoc.brew.sh/Formula
# PLEASE REMOVE ALL GENERATED COMMENTS BEFORE SUBMITTING YOUR PULL REQUEST!
class Windowmaker < Formula
  desc "Window Maker is an X11 window manager originally designed to provide integration support for the GNUstep Desktop Environment, although it can run stand alone. In every way possible, it reproduces the elegant look and feel of the NeXTSTEP user interface."
  homepage "https://www.windowmaker.org/"
  head "https://github.com/gaelicWizard/wmaker.git", branch: "macOS"
  url "https://repo.or.cz/wmaker-crm.git/snapshot/f9bc310fa686c226da42164ca04462e32a314b15.tar.gz"
  version "0.95.9"
  sha256 "921ea48954248f0d0ab13eb7724127469a2af7e90e22b2ae084cd3a0570bc520"
  license ""

  depends_on "autoconf" => :build
  depends_on "automake" => :build
  depends_on "libtool" => :build
  depends_on "pkg-config" => :build

  depends_on "jpeg" => :recommended
  depends_on "libtiff" => :recommended
  depends_on "webp" => :recommended

  depends_on "libx11"
  depends_on "libxinerama" => :recommended
  depends_on "libxext"
  depends_on "libxmu"
  depends_on "libxrandr" => :recommended
  depends_on "imagemagick" => :optional
  depends_on "libxpm" => :recommended
  depends_on "freetype"
  depends_on "fontconfig"
  depends_on "libxft"
  depends_on "giflib" => :optional
  #depends_on "gaelicWizard/GNUstep-Makefiles" => :optional
  #depends_on :x11

  def install
    # https://rubydoc.brew.sh/Formula.html#std_configure_args-instance_method
    system "touch", "-t", '2000-01-01', "INSTALL-WMAKER", "README.i18n"
    system "./autogen.sh"
    system "./configure", *std_configure_args,
                         "--disable-silent-rules",
                         "--disable-static",
                         "--enable-xinerama",
                         "--enable-xdnd",
                         "--enable-shape",
                         "--enable-shm",
                         "--enable-randr",
                         "--enable-animations",
                         "--enable-mwm-hints",
                         "--enable-xlocale",
                         "--enable-wmreplace",
                         "--enable-xpm",
                         "--enable-png",
                         "--enable-jpeg",
                         "--enable-tiff",
                         "--enable-webp",
                         "--enable-usermenu",
                         "--with-pixmapdir=/usr/X11/share/pixmaps",
                         "--with-x=/usr/X11",
                         "--x-includes=/usr/X11/include",
                         "--x-libraries=/usr/X11/lib",
                         "--disable-ld-version-script"
    # system "cmake", "-S", ".", "-B", "build", *std_cmake_args
    system "make", "install"
  end

  test do
    # `test do` will create, run in and delete a temporary directory.
    #
    # This test will fail and we won't accept that! For Homebrew/homebrew-core
    # this will need to be a test that verifies the functionality of the
    # software. Run the test with `brew test WindowMaker`. Options passed
    # to `brew install` such as `--HEAD` also need to be provided to `brew test`.
    #
    # The installed folder is not in the path, so use the entire path to any
    # executables being tested: `system "#{bin}/program", "do", "something"`.
    system "false"
  end
end
