#--------------------------------
# Get Brew and Install Apps/Tools
#--------------------------------
/bin/bash -c "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/master/install.sh)"
brew bundle install

#-----------------
# Package Managers
#-----------------

# TMUX Package Manager
git clone https://github.com/tmux-plugins/tpm ~/.tmux/plugins/tpm

# Node manager
curl -L https://git.io/n-install | bash

#-------------------
# VS Code Vim Config
#-------------------
defaults write com.microsoft.VSCode ApplePressAndHoldEnabled -bool false
defaults delete -g ApplePressAndHoldEnabled

#--------------
# Iterm2 Config
#--------------
defaults write com.googlecode.iterm2.plist PrefsCustomFolder -string "~/.cache/iterm2"
defaults write com.googlecode.iterm2.plist LoadPrefsFromCustomFolder -bool true
