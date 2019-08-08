
themels() {
  if [[  $ITERM_PROFILE =~ 'light' ]]
  then
    colorls --light $@
  else
    colorls $@
  fi
}
alias colorls=themels
alias ls='colorls'
alias la='colorls -lA'
alias tree='colorls --git-status --tree'

alias grep='grep --color'

alias -g H='| head'
alias -g T='| tail'
alias -g G='| grep'
alias -g L="| less"
alias -g M="| most"

alias rm='rm -i'
alias cp='cp -i'
alias mv='mv -i'

