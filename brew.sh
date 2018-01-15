#!/usr/bin/env bash

# Install command-line tools using Homebrew.

# Make sure we’re using the latest Homebrew.
brew update

# Upgrade any already-installed formulae.
brew upgrade

# Install GNU core utilities (those that come with macOS are outdated).
# Don’t forget to add `$(brew --prefix coreutils)/libexec/gnubin` to `$PATH`.
brew install coreutils

# Install Bash 4.
# Note: don’t forget to add `/brew/bin/bash` to `/etc/shells` before
# running `chsh`.
brew install bash
brew install bash-completion2

# Switch to using brew-installed bash as default shell
if ! fgrep -q '/brew/bin/bash' /etc/shells; then
  echo '/brew/bin/bash' | sudo tee -a /etc/shells;
  chsh -s /brew/bin/bash;
fi;

# Install more recent versions of some macOS tools.
brew install neovim
brew install git
brew install tree
brew install crystal-lang
brew install fzf
brew isntall ag
brew install heroku
brew install openssl
brew install xz
brew install telnet
brew install wget

# Remove outdated versions from the cellar.
brew cleanup
