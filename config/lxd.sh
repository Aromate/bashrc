if [[ $(pwd) == "/root" ]]; then
	cd
fi

alias lxc='incus'
alias lxcl='incus list -c="ns4tb"'

# 生成以lxc容器名为别名的ssh命令
# 可以使用容器名直接ssh到容器,并执行命令
# 例如: mylxc1 ls -l
lxc_command_setup() {
  local hosts=($(incus list -c="n" -f json | jq ".[].name" -r))
  for host in ${hosts[@]}; do
    # eval "$host() { ssh $host \$@ }"
    # echo ${host}
    # eval "${host}() { incus exec $host -- /bin/sudo --user=#1000 --login }"
    alias $host="incus exec $host -- /bin/sudo --user=#1000 --login"
    alias ${host}g="nohup incus console $host --type=vga \$@  1>/dev/null 2>&1 &"
    # eval "${host}s() { incus start $host \$@ }"
    # eval "${host}r() { incus restart $host --force \$@ }"
    # eval "${host}g() { }"
  done
}

lxc_command_setup
