#!/bin/sh

##
# This script does the bare minimum required to get a working make(1), then exec's it.
##


xcode-select -p || {
	xcode-select --install
	softwareupdate -i -a
}

curl -L "https://github.com/gaelicWizard/homebrew-Tools/HEAD/GNUmakefile" | exec gmake -f- -C ~
