export PATH="/usr/local/bin:$PATH"
export PATH=”/usr/local/opt/python@3.8/libexec/bin:$PATH”
export PATH="/usr/local/sbin:$PATH"
export PATH="~/tools:$PATH"


# alias
## ls w/ color
alias ls='ls -G'

## git
alias ga='git add'
alias gc='git commit'
alias gp='git push'


# ls after cd
chpwd() { ls -G }


#omit cd
setopt auto_cd

# zplugin
source ~/.zinit/bin/zinit.zsh

# choose prompt
zinit light sindresorhus/pure
#zinit light denysdovhan/spaceship-prompt

# suggestions when using zsh
zinit light zsh-users/zsh-autosuggestions

# enable syntax highlighting
zinit light zdharma/fast-syntax-highlighting
