#--------------------------------
# Get Brew and Install Apps/Tools
#--------------------------------
/usr/bin/ruby -e "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/master/install)"
brew bundle install

#-----------------
# Package Managers
#-----------------

# Vim Plug
curl -fLo ~/.local/share/nvim/site/autoload/plug.vim --create-dirs https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim

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
