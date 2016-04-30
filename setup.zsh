# Install oh my zsh
sh -c "$(curl -fsSL https://raw.githubusercontent.com/robbyrussell/oh-my-zsh/master/tools/install.sh)"

# Install apt packages
sudo apt-get install silversearcher-ag

# Copy dotfiles
ln -s ~/github/dotfiles/dircolors/.dircolors ~
ln -s ~/github/dotfiles/zsh/.zshrc ~
ln -s ~/github/dotfiles/vim/.vimrc ~
ln -s ~/github/dotfiles/fzf/.fzf.zsh ~
ln -s ~/github/dotfiles/tmux/.tmux.conf ~
ln -s ~/github/dotfiles/tmux/.tmuxline ~

