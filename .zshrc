path=(
    /usr/local/sbin
    /usr/local/bin
    /usr/sbin
    /usr/bin
    /sbin
    /bin
)

#-----------
# My plugins
#-----------
source <(antibody init)
export LOCAL_ZSH=$HOME/.zsh
cat $HOME/.zsh_plugins.txt | sed 's@%LOCAL%@'"$LOCAL_ZSH"'@' | antibody bundle

#-------------------
# Optional local zsh
#-------------------
[ -f ~/.local_zsh.zsh ] && source ~/.local_zsh.zsh
