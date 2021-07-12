class SshAskpass < Formula
  desc "The ssh-askpass util for MacOS"
  homepage "https://github.com/gaelicWizard/ssh-askpass/"
  url "https://github.com/gaelicWizard/ssh-askpass/archive/v1.2.2-jp2.tar.gz"
  sha256 "76bbac3a5d2041d4b8a09455c84857e2fe9725b073be8f54222a4e1d7165aafd"

  def install
    bin.install "ssh-askpass"
    prefix.install_symlink "ssh-askpass.plist" => "#{plist_name}.plist"
  end

  def caveats; <<~EOF
    NOTE: You will need to run the following to load the SSH_ASKPASS environment variable:
      brew services start #{name}
    EOF
  end

  test do
    system "true"
  end
end
