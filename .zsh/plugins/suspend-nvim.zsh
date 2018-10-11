foreground-nvim() {
  fg %nvim
}
zle -N foreground-nvim
bindkey '^Z' foreground-nvim
