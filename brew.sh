#!/usr/bin/env bash

set -e

# Install command-line tools using Homebrew.

# Make sure we’re using the latest Homebrew.
brew update

# Upgrade any already-installed formulae.
brew upgrade

# Install GNU core utilities (those that come with macOS are outdated).
# Don’t forget to add `$(brew --prefix coreutils)/libexec/gnubin` to `$PATH`.
brew install coreutils

# Install Fish.
# Note: don’t forget to add `/brew/bin/bash` to `/etc/shells` before
# running `chsh`.
brew install fish

# Switch to using brew-installed bash as default shell
if ! fgrep -q '/brew/bin/fish' /etc/shells; then
  echo '/brew/bin/fish' | sudo tee -a /etc/shells;
  chsh -s /brew/bin/fish;
fi;

# Install more recent versions of some macOS tools.
brew install neovim
brew install git
brew install tree
brew install fzf
brew install ag
brew install heroku
brew install openssl
brew install telnet
brew install wget
brew install fd
brew install rbenv
brew install awscli
brew install

# Remove outdated versions from the cellar.
brew cleanup
