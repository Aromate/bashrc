unsetproxy() {
  unset http_proxy
  unset https_proxy
  unset all_proxy
}

setproxy() {
  local ip_addr=127.0.0.1
  export {http,https,all}_proxy=http://${ip_addr}:8118
  if [[ $1 == "socks5" ]]; then
    export {http,https,all}_proxy=socks5://127.0.0.1:1080
  fi
}
setproxy
