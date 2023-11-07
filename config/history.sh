# config bash history
# blog:
# https://blog.sanctum.geek.nz/better-bash-history/
# size
# autosave commons
# ignore space begin,and ignore saved history
# ignore some histroy record, like lsblk,ls
# set history append not cover
HISTFILESIZE=1000000
HISTSIZE=1000000
PROMPT_COMMAND='history -a'
HISTCONTROL=ignoreboth
HISTIGNORE='tmux:lsblk:ls:bg:fg:history'
shopt -s histappend
bind 'set show-all-if-ambiguous on'
bind 'TAB:menu-complete'
