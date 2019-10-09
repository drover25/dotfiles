alias cat='bat'

alias ls='exa'
alias la='exa -la --git'
alias tree='exa --tree --git'

alias grep='grep --color'

alias -g H='| head'
alias -g T='| tail'
alias -g G='| grep'
alias -g L="| less"
alias -g M="| most"
alias -g C="| cat"
alias -g Y="| cat -l yaml"

alias rm='rm -i'
alias cp='cp -i'
alias mv='mv -i'

mdless() {
  mdcat "$@" | less -r
}
