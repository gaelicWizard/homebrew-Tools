cask "quicktime-fixer" do
  version "2021.04.23"
  sha256 "54260cbd2677b6f41e36465fde518e60f80209cb71f7a0246edfa9b8411b4b79"

  url "https://github.com/Wowfunhappy/QuickTime-Fixer/releases/download/#{version}/QuickTime.Player.X.10.2.Mod.dmg"
  name "QuickTime-Fixer"
  desc "Making Mountain Lion QuickTime less broken on Mavericks"
  homepage "https://github.com/Wowfunhappy/QuickTime-Fixer"

  app "QuickTime Player.app"
end
