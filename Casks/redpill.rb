cask "redpill" do
  version "1.0"
  sha256 "152cf3823fcb37c2ad43396007bde6cec79681b58d367288091ea0780e2327be"

  url "https://github.com/RoaddogLabs/RedPill/releases/download/v#{version}/RedPill.saver.zip"
  name "RedPill"
  desc "a 3D OpenGL 'Matrix' screensaver for Mac OS X"
  homepage "https://github.com/gaelicWizard/RedPill"

  screen_saver "RedPill.saver"
end
