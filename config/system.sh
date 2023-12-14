if [ -f /etc/lsb-release ]; then
  source /etc/lsb-release
fi

if [ -f /etc/os-release ]; then
  source /etc/os-release
fi

if [[ $DISTRIB_ID == "Gentoo" ]]; then
  # fzf
  source /usr/share/bash-completion/completions/fzf
  source /usr/share/fzf/key-bindings.bash
  # autojump
  source /usr/share/autojump/autojump.bash
fi

if [[ $NAME == "Arch Linux" ]]; then
  source /usr/share/fzf/completion.bash
  source /usr/share/fzf/key-bindings.bash
fi
