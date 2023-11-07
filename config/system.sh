source /etc/lsb-release

if [[ $DISTRIB_ID == "Gentoo" ]]; then
  # fzf
  source /usr/share/bash-completion/completions/fzf
  source /usr/share/fzf/key-bindings.bash
  # autojump
  source /usr/share/autojump/autojump.bash
fi
