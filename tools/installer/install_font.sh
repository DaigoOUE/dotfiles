#! /bin/bash
# powerline font
git clone https://github.com/powerline/fonts.git --depth=1
cd fonts
./install.sh
cd ../
rm -rf fonts


# PlemolJP
brew install --cask font-plemol-jp-nf
