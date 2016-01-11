# Use Ag
# ---------
export FZF_DEFAULT_COMMAND='ag -g "" --hidden'
export FZF_CTRL_T_COMMAND="$FZF_DEFAULT_COMMAND"

# Custom fzf path
# ---------------
fzf_path=$HOME/github/dotfiles/fzf

# Setup fzf
# ---------
if [[ ! "$PATH" == *$fzf_path/.fzf/bin* ]]; then
  export PATH="$PATH:$fzf_path/.fzf/bin"
fi

# Man path
# --------
if [[ ! "$MANPATH" == *$fzf_path/.fzf/man* && -d "$fzf_path/.fzf/man" ]]; then
  export MANPATH="$MANPATH:$fzf_path/.fzf/man"
fi

# Auto-completion
# ---------------
[[ $- == *i* ]] && source "$fzf_path/.fzf/shell/completion.zsh" 2> /dev/null

# Key bindings
# ------------
source "$fzf_path/.fzf/shell/key-bindings.zsh"

