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
zplug "plugins/common-aliases", from:oh-my-zsh
zplug "plugins/git", from:oh-my-zsh
zplug "plugins/git-extras", from:oh-my-zsh
zplug "plugins/vi-mode", from:oh-my-zsh

zplug "felixr/docker-zsh-completion"
zplug "zsh-users/zsh-completions"
zplug "zdharma/fast-syntax-highlighting", defer:2

zplug "~/.zsh/plugins", from:local

zplug "romkatv/dotfiles-public", use:.purepower
zplug "romkatv/powerlevel10k", use:powerlevel10k.zsh-theme

# Install plugins if there are plugins that have not been installed
if ! zplug check --verbose; then
    printf "Install? [y/N]: "
    if read -q; then
        echo; zplug install
    fi
fi

# Then, source plugins and add commands to $PATH
zplug load
