PROMPT='$(current_dir)$(git_prompt_info)$(local_prompt_info)$(prompt)'

function separator() {
  echo -n '%B%F{red}|%f%b'
}

function current_dir() {
  echo -n '%F{cyan}%1~%f'
}

function prompt() {
  echo -n ' %(?.%F{cyan}.%F{red})%B❯%f%b '
}

git_prompt_info() {
  if [[ "$(command git rev-parse --is-inside-work-tree 2>/dev/null)" ]]; then
    local message=""
    local message_color="%F{green}"

    local staged=$(git status --porcelain 2>/dev/null | grep -e "^M " -e "^A ")
    local unstaged=$(git status --porcelain 2>/dev/null | grep -e "^ M" -e "^??")

    if [[ -n ${staged} ]]; then
      message_color="%F{red}"
    elif [[ -n ${unstaged} ]]; then
      message_color="%F{yellow}"
    fi

    local branch=$(git rev-parse --abbrev-ref HEAD 2>/dev/null)
    if [[ -n ${branch} ]]; then
      message+="$(separator)${message_color}${branch}%f"
    fi

    echo -n "${message}"
  fi
}

# Override in .local_zsh.zsh
function local_prompt_info() {
}
