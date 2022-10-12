export BAT_THEME="Nord"

alias cat='bat'

alias ls='exa'
alias la='exa -la --git'
alias tree='exa --tree --git'

alias grep='grep --color'

alias -g C="| cat"
alias -g G='| grep'
alias -g H='| head'
alias -g L="| less"
alias -g M="| most"
alias -g T='| tail'
alias -g Y="| cat -l yaml"

alias rm='rm -i'
alias cp='cp -i'
alias mv='mv -i'

alias oid='mongosh --eval "new ObjectId().toString()" --nodb --quiet | tr -d "\n"'

alias k9s='TERM=xterm-256color k9s'
alias k=kubectl
alias ok='okteto'

alias gco='git checkout'
alias gcb='git checkout -b'
alias gpsup='git push-upstream'
alias gst='git status'
alias gpf='git push --force'

mdless() {
  mdcat "$@" | less -r
}

get_dashboard_token() {
  kubectl describe secret -n kubernetes-dashboard \
    $(kubectl -n kubernetes-dashboard get secret | grep admin-user | awk '{print $1}') |
    awk '$1=="token:"{print $2}' | pbcopy
}

tma() {
  tmux attach-session -t $1 ||
  tmux new-session -s $1
}

