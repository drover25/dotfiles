# Custom fzf path
# ---------------
fzf_path=/usr/local/opt/fzf

# Use Ag
# ---------
export FZF_DEFAULT_COMMAND='(rg --files --hidden) 2> /dev/null'
export FZF_CTRL_T_COMMAND="$FZF_DEFAULT_COMMAND"
export FZF_TMUX=1

_fzf_compgen_path() {
  fd --hidden --follow --exclude ".git" . "$1"
}

_fzf_compgen_dir() {
  fd --type d --hidden --follow --exclude ".git" . "$1"
}

# Auto-completion
# ---------------
[[ $- == *i* ]] && source "$fzf_path/shell/completion.zsh" 2> /dev/null

# Key bindings
# ------------
source "$fzf_path/shell/key-bindings.zsh"

