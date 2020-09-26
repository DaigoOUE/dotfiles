#! /bin/bash
# create symbolic links
ln -s ~/dotfiles/.vimrc ~/.vimrc
ln -s ~/dotfiles/.gvimrc ~/.gvimrc
ln -s ~/dotfiles/.bashrc ~/.bashrc
ln -s ~/dotfiles/.bash_profile ~/.bash_profile
ln -s ~/dotfiles/.vim ~/.vim
ln -s ~/dotfiles/.gitconfig ~/.gitconfig
ln -s ~/dotfiles/.gitignore_global ~/.gitignore_global
ln -s ~/dotfiles/.latexmkrc ~/.latexmkrc

# install dein.vim
curl https://raw.githubusercontent.com/Shougo/dein.vim/master/bin/installer.sh > installer.sh
sh ./installer.sh ~/.cache/dein

# install powerline font for the lightline.vim
git clone https://github.com/powerline/fonts.git --depth=1
cd fonts
./install.sh
cd ../
rm -rf fonts
