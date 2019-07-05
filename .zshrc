path=(
    /usr/local/sbin
    /usr/local/bin
    /usr/sbin
    /usr/bin
    /sbin
    /bin
)

# The following lines were added by compinstall
zstyle :compinstall filename '/Users/drover/.zshrc'

autoload -Uz compinit
compinit
# End of lines added by compinstall

##-----------
## My plugins
##-----------
if [ ! -f ~/.zsh_plugins.sh ]; then
  export LOCAL_ZSH=$HOME/.zsh
  cat ~/.zsh_plugins.txt | sed 's@%LOCAL%@'"$LOCAL_ZSH"'@' | antibody bundle > ~/.zsh_plugins.sh
fi
source ~/.zsh_plugins.sh
# compinit

export PATH="$HOME/.yarn/bin:$HOME/.config/yarn/global/node_modules/.bin:$PATH"


export N_PREFIX="$HOME/n"; [[ :$PATH: == *":$N_PREFIX/bin:"* ]] || PATH+=":$N_PREFIX/bin"  # Added by n-install (see http://git.io/n-install-repo).

# tabtab source for serverless package
# uninstall by removing these lines or running `tabtab uninstall serverless`
[[ -f /Users/drover/work/rallynow/rally-app/node_modules/tabtab/.completions/serverless.zsh ]] && . /Users/drover/work/rallynow/rally-app/node_modules/tabtab/.completions/serverless.zsh
# tabtab source for sls package
# uninstall by removing these lines or running `tabtab uninstall sls`
[[ -f /Users/drover/work/rallynow/rally-app/node_modules/tabtab/.completions/sls.zsh ]] && . /Users/drover/work/rallynow/rally-app/node_modules/tabtab/.completions/sls.zsh
# tabtab source for slss package
# uninstall by removing these lines or running `tabtab uninstall slss`
[[ -f /Users/drover/work/rallynow/rally-app/node_modules/tabtab/.completions/slss.zsh ]] && . /Users/drover/work/rallynow/rally-app/node_modules/tabtab/.completions/slss.zsh