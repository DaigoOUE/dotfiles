export PATH="/usr/local/bin:$PATH"
export PATH=”/usr/local/opt/python@3.8/libexec/bin:$PATH”
export PATH="/usr/local/sbin:$PATH"
export PATH="~/tools:$PATH"


# ls after cd
chpwd() { ls -G }

# ls w/ color
alias ls='ls -G'


#omit cd
setopt auto_cd


# zplugin
source $HOME/.zinit/bin/zinit.zsh

# choose prompt
zinit light sindresorhus/pure
#zinit light denysdovhan/spaceship-prompt

# suggestions when using zsh
zinit light zsh-users/zsh-autosuggestions

# enable syntax highlighting
zinit light zdharma/fast-syntax-highlighting
