cask "xcode-tools" do
  version "12.5"
  sha256 "46f09b2ccd55bb6e47020438f5ad73ab5775d199935a2da0ad5001316a4da99f"

  url "https://download.developer.apple.com/Developer_Tools/Additional_Tools_for_Xcode_#{version}/Additional_Tools_for_Xcode_#{version}.dmg"
  name "Xcode-Tools"
  desc "Additional Tools for Xcode #{version}"
  homepage "https://developer.apple.com/download/all/?q=Additional%20Tools"

  prefpane "Hardware/Network Link Conditioner.prefPane"
  app "Audio/AU Lab.app", target: "Developer/AU Lab.app"
  app "Graphics/OpenGL Driver Monitor.app", target: "Developer/OpenGL Driver Monitor.app"
  app "Graphics/OpenGL Profiler.app", target: "Developer/OpenGL Profiler.app"
  app "Graphics/Pixie.app", target: "Developer/Pixie.app"
  app "Graphics/Quartz Debug.app", target: "Developer/Quartz Debug.app"
  app "Hardware/HomeKit Accessory Simulator.app", target: "Developer/HomeKit Accessory Simulator.app"
  app "Hardware/IORegistryExplorer.app", target: "Developer/IORegistryExplorer.app"
  app "Hardware/PacketLogger.app", target: "Developer/PacketLogger.app"
  app "Hardware/Printer Simulator.app", target: "Developer/Printer Simulator.app"
  app "Utilities/Clipboard Viewer.app", target: "Developer/Clipboard Viewer.app"
  app "Utilities/CrashReporterPrefs.app", target: "Developer/CrashReporterPrefs.app"
  app "Utilities/Help Indexer.app", target: "Developer/Help Indexer.app"
end
