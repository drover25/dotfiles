export DOTFILES_REPO=$HOME/github/dotfiles

# User configuration

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

source <(antibody init)
antibody bundle < ~/.zsh_plugins.txt

#------
# Theme
#------
source $DOTFILES_REPO/zsh/custom/themes/drover.zsh-theme

#--------------------
# Setup shell colors
#--------------------
if [ -n "$DISPLAY" -a "$TERM" "==" "xterm" ]; then
    export TERM=xterm-256color
fi
[ -f $DOTFILES_REPO/dircolors/.dircolors ] && eval `dircolors $DOTFILES_REPO/dircolors/.dircolors`

#---------------
# nVim setup
#---------------
export EDITOR=nvim
export PATH="$HOME/neovim/bin:$PATH"
export XDG_CONFIG_HOME="$HOME/.config"

#-------------------------
# Setup FZF
#-------------------------
[ -f $DOTFILES_REPO/fzf/.fzf.zsh ] && source $DOTFILES_REPO/fzf/.fzf.zsh

#---------------
# My aliases
#---------------
# Map z to j for fasd plugin
alias j='z'
# Map vi to nvim
alias vi='nvim'
# Map vim to nvim
alias vim='nvim'

#---------------
# Local setup
#---------------
[ -f ~/.local_zsh.zsh ] && source ~/.local_zsh.zsh

[ -f ~/.fzf.zsh ] && source ~/.fzf.zsh
