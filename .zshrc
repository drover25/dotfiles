# Enable Powerlevel10k instant prompt. Should stay close to the top of ~/.zshrc.
# Initialization code that may require console input (password prompts, [y/n]
# confirmations, etc.) must go above this block; everything else may go below.
if [[ -r "${XDG_CACHE_HOME:-$HOME/.cache}/p10k-instant-prompt-${(%):-%n}.zsh" ]]; then
  source "${XDG_CACHE_HOME:-$HOME/.cache}/p10k-instant-prompt-${(%):-%n}.zsh"
fi

path=(
    /usr/local/sbin
    /usr/local/bin
    $HOME/go/bin
    /usr/sbin
    /usr/bin
    /sbin
    /bin
    $path
)

export ZPLUG_HOME=/usr/local/opt/zplug
source $ZPLUG_HOME/init.zsh
zplug "plugins/colored-man-pages", from:oh-my-zsh
zplug "plugins/git", from:oh-my-zsh
zplug "plugins/vi-mode", from:oh-my-zsh
zplug "zsh-users/zsh-completions"
zplug "Aloxaf/fzf-tab"
zplug "kazhala/dotbare"
zplug "zdharma/fast-syntax-highlighting", defer:2
zplug "~/.config/zsh/plugins", from:local, defer:2
zplug "/usr/local/opt/git-extras/share/git-extras", from:local, defer:2
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

# ### Added by Zinit's installer
# if [[ ! -f $HOME/.zinit/bin/zinit.zsh ]]; then
#     print -P "%F{33}▓▒░ %F{220}Installing %F{33}DHARMA%F{220} Initiative Plugin Manager (%F{33}zdharma/zinit%F{220})…%f"
#     command mkdir -p "$HOME/.zinit" && command chmod g-rwX "$HOME/.zinit"
#     command git clone https://github.com/zdharma/zinit "$HOME/.zinit/bin" && \
#         print -P "%F{33}▓▒░ %F{34}Installation successful.%f%b" || \
#         print -P "%F{160}▓▒░ The clone has failed.%f%b"
# fi

# source "$HOME/.zinit/bin/zinit.zsh"
# # autoload -Uz _zinit
# # (( ${+_comps} )) && _comps[zinit]=_zinit

# # Load a few important annexes, without Turbo
# # (this is currently required for annexes)
# zinit light-mode for \
#     zinit-zsh/z-a-rust \
#     zinit-zsh/z-a-as-monitor \
#     zinit-zsh/z-a-patch-dl \
#     zinit-zsh/z-a-bin-gem-node

# ### End of Zinit's installer chunk

# zinit snippet OMZP::colored-man-pages
# zinit snippet OMZP::git
# zinit snippet OMZP::kubectl
# zinit snippet OMZP::vi-mode
# # zinit snippet OMZP::docker

# for plugin in  ~/.config/zsh/plugins/**/*; do
#   zinit snippet $plugin
# done

# zinit light-mode for \
#   zsh-users/zsh-completions \
#   iam4x/zsh-iterm-touchbar \
#   Aloxaf/fzf-tab \
#   zdharma/fast-syntax-highlighting \
#   romkatv/powerlevel10k

# function switch-p10k-config() {
#   emulate -L zsh
#   case $ITERM_PROFILE in
#     dark)         local cfg=~/.config/zsh/theme/p10k-dark.zsh;;
#     gruvbox-dark) local cfg=~/.config/zsh/theme/p10k-dark.zsh;;
#     *)            local cfg=~/.config/zsh/theme/p10k-rainbow.zsh;;
#   esac
#   [[ $cfg == $current_p10k_config ]] || source $cfg
#   typeset -g current_p10k_config=$cfg
# }

# switch-p10k-config
# precmd_functions+=(switch-p10k-config)

# autoload -Uz compinit
# compinit
# zinit cdreplay -q
