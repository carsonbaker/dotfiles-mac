source ~/.config/fish/fish_aliases
source ~/.config/fish/fish_variables

set fish_greeting

# My bin
set PATH $HOME/.bin $PATH

# Homebrew bin
set PATH /brew/bin $PATH

# RVM bin
set PATH $HOME/.rvm/bin $PATH

# Activate RVM
#rvm default

# Activate rbenv
status --is-interactive; and source (rbenv init -|psub)
