sh ./installer/install_font.sh

# install homebrew
/bin/bash -c "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/HEAD/install.sh)"

# install vim
brew install vim
sh ./installer/install_dein.sh
pip3 install --break-system-packages pynvim # required for deoplete

open ./colorscheme/iceberg.itermcolors

# latex (takes long time so execute in the end)
sh ./installer/install_mactex.sh

