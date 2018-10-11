#-------------
# Apt Packages
#-------------
sudo apt-get install fasd
sudo apt-get install git
sudo apt-get install git-extras
sudo apt-get install neovim
sudo apt-get install silversearcher-ag
sudo apt-get install tmux
sudo apt-get install zsh

#-----------------
# Package Managers
#-----------------

# Vim Plug
curl -fLo ~/.local/share/nvim/site/autoload/plug.vim --create-dirs \
    https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim

# ZSH Antibody
sh -c "$(curl -sL git.io/antibody | sh -s)"

# TMUX Package Manager
git clone https://github.com/tmux-plugins/tpm ~/.tmux/plugins/tpm

#-----------------
# Other packages
#-----------------

# FZF
git clone --depth 1 https://github.com/junegunn/fzf.git ~/.fzf
~/.fzf/install --bin

