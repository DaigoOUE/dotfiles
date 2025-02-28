sh ./installer/install_font.sh

# install homebrew
/bin/bash -c "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/HEAD/install.sh)"

brew install zsh

brew install gh

# install vim
brew install vim
sh ./installer/install_dein.sh
pip3 install --break-system-packages pynvim # required for deoplete

open ./colorscheme/iceberg.itermcolors

# zathura
brew tap zegervdv/zathura
brew install zathura
brew install zathura-pdf-poppller
mkdir -p $(brew --prefix zathura)/lib/zathura
ln -s $(brew --prefix zathura-pdf-poppler)/libpdf-poppler.dylib $(brew --prefix zathura)/lib/zathura/libpdf-poppler.dylib

# latex (takes long time so execute in the end)
sh ./installer/install_mactex.sh

brew cleanup
