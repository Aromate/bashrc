lxc_cmd=incus

if [[ $(which ${lxc_cmd}) == "" ]]; then
  return
fi

if [[ $(incus 1>/dev/null 2>&1) ]]; then
  return
fi

alias lxc="${lxc_cmd}"
alias lxcl="${lxc_cmd} list -c='ns4tb'"

lxc_command_setup() {
  local hosts=($(${lxc_cmd} list -c="n" -f json | jq ".[].name" -r))
  for host in ${hosts[@]}; do
    alias $host="${lxc_cmd} exec $host -- /bin/sudo --user=#1000 --login"
    alias ${host}g="swaymsg -q exec -- ${lxc_cmd} console $host --type=vga \$@  1>/dev/null 2>&1 &"
  done
}

lxc_command_setup
