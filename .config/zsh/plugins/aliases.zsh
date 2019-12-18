bat-theme() {
  if [[ $ITERM_PROFILE =~ 'light' ]]
  then echo --theme=OneHalfLight
  else echo --theme=OneHalfDark
  fi
}

alias cat='bat $(bat-theme)'

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

get_dashboard_token() {
  kubectl describe secret -n kubernetes-dashboard \
    $(kubectl -n kubernetes-dashboard get secret | grep admin-user | awk '{print $1}') \
    | awk '$1=="token:"{print $2}' | pbcopy

}
