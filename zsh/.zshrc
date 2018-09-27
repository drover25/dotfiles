path=(
    $HOME/bin
    /usr/lib/google-golang/bin
    /usr/local/buildtools/java/jdk/bin
    /usr/local/sbin
    /usr/local/bin
    /usr/sbin
    /usr/bin
    /sbin
    /bin
    $HOME/.rvm/bin
)
export PATH

#-----------
# My plugins
#-----------
source <(antibody init)
export DOTFILES_REPO=$HOME/github/dotfiles
cat $DOTFILES_REPO/zsh/.zsh_plugins.txt | sed 's@%LOCAL%@'"$DOTFILES_REPO"'@' | antibody bundle

#-------------------
# Optional local zsh
#-------------------
[ -f ~/.local_zsh.zsh ] && source ~/.local_zsh.zsh
