# Enable Powerlevel10k instant prompt. Should stay close to the top of ~/.zshrc.
# Initialization code that may require console input (password prompts, [y/n]
# confirmations, etc.) must go above this block, everything else may go below.
if [[ -r "${XDG_CACHE_HOME:-$HOME/.cache}/p10k-instant-prompt-${(%):-%n}.zsh" ]]; then
  source "${XDG_CACHE_HOME:-$HOME/.cache}/p10k-instant-prompt-${(%):-%n}.zsh"
fi

path=(
    /usr/local/sbin
    /usr/local/bin
    /usr/sbin
    /usr/bin
    /sbin
    /bin
)

export ZPLUG_HOME=/usr/local/opt/zplug
source $ZPLUG_HOME/init.zsh

zplug "plugins/colored-man-pages", from:oh-my-zsh
zplug "plugins/git", from:oh-my-zsh
zplug "plugins/git-extras", from:oh-my-zsh
zplug "plugins/kubectl", from:oh-my-zsh
zplug "plugins/vi-mode", from:oh-my-zsh

zplug "zsh-users/zsh-completions"
zplug "iam4x/zsh-iterm-touchbar"
zplug "blimmer/zsh-aws-vault"
zplug "zdharma/fast-syntax-highlighting", defer:2

zplug "~/.config/zsh/plugins", from:local, defer:1
zplug "~/.config/zsh/theme", from:local, defer:1

zplug "romkatv/powerlevel10k", use:"powerlevel10k.zsh-theme"

# Install plugins if there are plugins that have not been installed
if ! zplug check --verbose; then
    printf "Install? [y/N]: "
    if read -q; then
        echo; zplug install
    fi
fi

# Then, source plugins and add commands to $PATH
zplug load

# # To customize prompt, run `p10k configure` or edit ~/.p10k.zsh.
# [[ -f ~/.p10k.zsh ]] && source ~/.p10k.zsh

function switch-p10k-config() {
  emulate -L zsh
  case $ITERM_PROFILE in
    dark) local cfg=~/.config/zsh/theme/p10k-dark.zsh;;
    gruvbox-dark) local cfg=~/.config/zsh/theme/p10k-dark.zsh;;
    *)        local cfg=~/.config/zsh/theme/p10k-rainbow.zsh;;
  esac
  [[ $cfg == $current_p10k_config ]] || source $cfg
  typeset -g current_p10k_config=$cfg
}

switch-p10k-config
precmd_functions+=(switch-p10k-config)
