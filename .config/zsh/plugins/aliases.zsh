bat-theme() {
case $ITERM_PROFILE in
  nord)
    echo --theme=Nord
    ;;
  solarized-dark)
    echo --theme="Solarized \(dark\)"
    ;;
  solarized-light)
    echo --theme="Solarized \(light\)"
    ;;
  *)
    if [[ $ITERM_PROFILE =~ 'light' ]]
    then echo --theme=OneHalfLight
    else echo --theme=OneHalfDark
    fi
    ;;
esac
}

alias cat='bat $(bat-theme)'

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

mdless() {
  mdcat "$@" | less -r
}

get_dashboard_token() {
  kubectl describe secret -n kubernetes-dashboard \
    $(kubectl -n kubernetes-dashboard get secret | grep admin-user | awk '{print $1}') \
    | awk '$1=="token:"{print $2}' | pbcopy

}
