# Install oh my zsh
sh -c "$(curl -fsSL https://raw.githubusercontent.com/robbyrussell/oh-my-zsh/master/tools/install.sh)"

# Install apt packages
sudo apt-get install silversearcher-ag

# Copy dotfiles
ln -sf ~/github/dotfiles/dircolors/.dircolors ~
ln -sf ~/github/dotfiles/zsh/.zshrc ~
ln -sf ~/github/dotfiles/vim/.vimrc ~
ln -sf ~/github/dotfiles/fzf/.fzf.zsh ~
ln -sf ~/github/dotfiles/tmux/.tmux.conf ~
ln -sf ~/github/dotfiles/tmux/.tmuxline ~

