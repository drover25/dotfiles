case $ITERM_PROFILE in
nord)
  export BAT_THEME="Nord"
  ;;
solarized-dark)
  export BAT_THEME=""Solarized \(dark\)""
  ;;
solarized-light)
  export BAT_THEME=""Solarized \(light\)""
  ;;
*)
  if [[ $ITERM_PROFILE =~ 'light' ]]; then
    export BAT_THEME="OneHalfLight"
  else
    export BAT_THEME="OneHalfDark"
  fi
  ;;
esac

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

alias oid='mongo --eval "new ObjectId().valueOf()" --nodb --quiet | tr -d "\n"'

mdless() {
  mdcat "$@" | less -r
}

get_dashboard_token() {
  kubectl describe secret -n kubernetes-dashboard \
    $(kubectl -n kubernetes-dashboard get secret | grep admin-user | awk '{print $1}') |
    awk '$1=="token:"{print $2}' | pbcopy

}
