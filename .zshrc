export PATH="/usr/local/bin:$PATH"
export PATH="/usr/local/opt/python@3.10/bin:$PATH"
export PATH="/usr/local/sbin:$PATH"
export PATH="~/tools:$PATH"

# alias
## ls w/ color
alias ls='ls -G'

## git
alias ga='git add'
alias gc='git commit'
alias gp='git push'
alias gst='git status'
alias gd='git diff'


# ls after cd
chpwd() { ls -G }


#omit cd
setopt auto_cd


# zinit install
ZINIT_HOME="${XDG_DATA_HOME:-${HOME}/.local/share}/zinit/zinit.git"
[ ! -d $ZINIT_HOME ] && mkdir -p "$(dirname $ZINIT_HOME)"
[ ! -d $ZINIT_HOME/.git ] && git clone https://github.com/zdharma-continuum/zinit.git "$ZINIT_HOME"
source "${ZINIT_HOME}/zinit.zsh"

# choose prompt
zinit light sindresorhus/pure
#zinit light denysdovhan/spaceship-prompt

# suggestions when using zsh
zinit light zsh-users/zsh-autosuggestions

# enable syntax highlighting
zinit light zdharma/fast-syntax-highlighting

# Load a few important annexes, without Turbo
# (this is currently required for annexes)
zinit light-mode for \
    zdharma-continuum/zinit-annex-as-monitor \
    zdharma-continuum/zinit-annex-bin-gem-node \
    zdharma-continuum/zinit-annex-patch-dl \
    zdharma-continuum/zinit-annex-rust

### End of Zinit's installer chunk
