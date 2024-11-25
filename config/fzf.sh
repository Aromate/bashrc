# config fzf
# Preview file content using bat (https://github.com/sharkdp/bat)
export FZF_CTRL_T_OPTS="
--preview 'bat -n --color=always {}'
--bind 'ctrl-/:change-preview-window(down|hidden|)'"
# CTRL-/ to toggle small preview window to see the full command
# CTRL-Y to copy the command into clipboard using pbcopy
export FZF_CTRL_R_OPTS="
--preview 'echo {}' --preview-window up:3:hidden:wrap
--bind 'ctrl-/:toggle-preview'
--bind 'ctrl-y:execute-silent(echo -n {2..} | wl-copy)+abort'
--color header:italic
--header 'Press CTRL-Y to copy command into clipboard'"
# Print tree structure in the preview window
export FZF_ALT_C_OPTS="--preview 'tree -C {}'"


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
  # source /usr/share/autojump/autojump.bash
fi

if [[ $NAME == "Arch Linux" ]]; then
  source /usr/share/fzf/completion.bash
  source /usr/share/fzf/key-bindings.bash
fi
