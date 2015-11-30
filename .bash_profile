#load .bashrc
if [ "$TERM_PROGRAM" = "Apple_Terminal" ]; then
  if [ -f ~/.bashrc ]; then
    source ~/.bashrc
  fi
fi
eval "$(rbenv init -)"
