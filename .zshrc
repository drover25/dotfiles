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
zplug "plugins/vi-mode", from:oh-my-zsh

zplug "zsh-users/zsh-completions"
zplug "iam4x/zsh-iterm-touchbar"
zplug "blimmer/zsh-aws-vault"
zplug "zdharma/fast-syntax-highlighting", defer:2

zplug "~/.config/zsh/plugins", from:local, defer:1

zplug "romkatv/powerlevel10k", use:"{powerlevel10k.zsh-theme,config/p10k-lean.zsh}"

# Install plugins if there are plugins that have not been installed
if ! zplug check --verbose; then
    printf "Install? [y/N]: "
    if read -q; then
        echo; zplug install
    fi
fi

# Then, source plugins and add commands to $PATH
zplug load
