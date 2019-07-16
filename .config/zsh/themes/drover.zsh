PROMPT='$(current_dir)$(git_prompt_info)$(local_prompt_info)$(last_run_time)
$(prompt)'

function separator() {
  echo -n '%K{8}%F{0}%f%k'
}

function end_arrow() {
  echo -n '%K{0}%F{8}%f%k%b'
}

function last_arrow() {
  echo -n '%k%F{8}%f%b'
}

function current_dir() {
  echo -n "%K{blue}%F{black}%B$(shrink_path -l -T) %f%k%b%K{black}%F{blue}%f%k%b"
}

function prompt() {
  echo -n '%F{blue}%B❯%f%b '
}

function preexec() {
  timer=${timer:-$SECONDS}
}

function precmd() {
  if [ $timer ]; then
    timer_show=$(($SECONDS - $timer))
    export LAST_RUN_TIME="${timer_show}s"
    unset timer
  fi
}

function last_run_time() {
  echo -n "$(separator)%B%K{8}%(?.%F{green}.%F{red}) ${LAST_RUN_TIME} $(last_arrow)"
}

git_prompt_info() {
  if [[ "$(command git rev-parse --is-inside-work-tree 2>/dev/null)" ]]; then
    local message=""
    local message_color="%B%K{8}%F{green}"

    local staged=$(git status --porcelain 2>/dev/null | grep -e "^M " -e "^A ")
    local unstaged=$(git status --porcelain 2>/dev/null | grep -e "^ M" -e "^??")

    if [[ -n ${staged} ]]; then
      message_color+="%F{red}"
    elif [[ -n ${unstaged} ]]; then
      message_color+="%F{yellow}"
    fi

    local branch=$(git rev-parse --abbrev-ref HEAD 2>/dev/null)
    if [[ -n ${branch} ]]; then
      message+="$(separator)${message_color} ${branch} $(end_arrow)"
    fi

    echo -n "${message}"
  fi
}

# Override in .local_zsh.zsh
function local_prompt_info() {
}
