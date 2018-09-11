# Install antibody
sh -c "$(curl -sL git.io/antibody | sh -s)"

# Install apt packages
sudo apt-get install silversearcher-ag

# Copy dotfiles
ln -sf ~/github/dotfiles/dircolors/.dircolors ~
ln -sf ~/github/dotfiles/zsh/.zshrc ~
ln -sf ~/github/dotfiles/vim/.vimrc ~
ln -sf ~/github/dotfiles/fzf/.fzf.zsh ~
ln -sf ~/github/dotfiles/tmux/.tmux.conf ~
ln -sf ~/github/dotfiles/tmux/.tmuxline ~

