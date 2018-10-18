path=(
    /usr/local/sbin
    /usr/local/bin
    /usr/sbin
    /usr/bin
    /sbin
    /bin
)

##-----------
## My plugins
##-----------
if [ ! -f ~/.zsh_plugins.sh ]; then
  export LOCAL_ZSH=$HOME/.zsh
  cat ~/.zsh_plugins.txt | sed 's@%LOCAL%@'"$LOCAL_ZSH"'@' | antibody bundle > ~/.zsh_plugins.sh
fi
source ~/.zsh_plugins.sh

#-------------------
# Optional local zsh
#-------------------
[ -f ~/.local_zsh.zsh ] && source ~/.local_zsh.zsh
