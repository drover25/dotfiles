if [ -n "$VSCODE_NONCE" ]; then
  export EDITOR="code --wait"
else
  export EDITOR=nvim
fi

export XDG_CONFIG_HOME="$HOME/.config"
