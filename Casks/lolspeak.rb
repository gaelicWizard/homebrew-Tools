cask "lolspeak" do
  version "1.0.0"
  sha256 "788cb00e5afd8ce48aee227fdfee35329f1d7609cfe1e185adc2483d3f612fb7"

  url "http://www.dribin.org/dave/resources/files/lolspeak/LOLspeak.dictionary-#{version}.zip"
  name "LOLspeak"
  desc "A LOLspeak translation dictionary. https://github.com/ddribin/lolspeak-bb.git"
  homepage "https://www.dribin.org/dave/lolspeak/"

  dictionary "LOLspeak.dictionary"
end
