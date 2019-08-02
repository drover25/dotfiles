if [ "$TERM_PROGRAM" = 'iTerm.app' ]; then

  iterm-emit() {
    local template="\e]${1}\007"
    shift
    if [[ -n "$TMUX" || "$TERM" = tmux* ]]; then
      template="\ePtmux;\e${template}\e\\"
    fi
    printf "$template" "$@"
  }

  iterm-profile() {
    iterm-emit '1337;SetProfile=%s' "$1"
    export ITERM_PROFILE=$1
    if [[ -n "$TMUX" || "$TERM" = tmux* ]]; then
        tmux set-environment ITERM_PROFILE $1
    fi
  }

fi
