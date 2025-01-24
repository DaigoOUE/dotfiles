brew install mactex

# Japanese fonts
sudo tlmgr update --self --all
sudo tlmgr repository add https://mirror.ctan.org/systems/texlive/tlcontrib tlcontrib
sudo tlmgr pinning add tlcontrib "*"
sudo tlmgr install japanese-otf-nonfree ptex-fontmaps-macos cjk-gs-integrate-macos
sudo cjk-gs-integrate --link-texmf --cleanup
sudo cjk-gs-integrate-macos --link-texmf --fontdef-add=cjkgs-macos-highsierra.dat
sudo mktexlsr
sudo kanji-config-updmap-sys --jis2004 hiragino-highsierra-pron
