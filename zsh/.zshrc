export ZSH=$HOME/.oh-my-zsh
export DOTFILES_REPO=$HOME/github/dotfiles
export ZSH_CUSTOM=$DOTFILES_REPO/zsh/custom

ZSH_THEME="drover"
plugins=(git git-extras fasd)

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

source $ZSH/oh-my-zsh.sh

#--------------------
# Setup shell colors
#--------------------
if [ -n "$DISPLAY" -a "$TERM" "==" "xterm" ]; then
    export TERM=xterm-256color
fi

#---------------
# nVim setup
#---------------
export XDG_CONFIG_HOME="$HOME/.config"
export PATH="$HOME/neovim/bin:$PATH"

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
