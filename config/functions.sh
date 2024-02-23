unsetproxy() {
  unset http_proxy
  unset https_proxy
  unset all_proxy
}

setproxy() {
  export {http,https,all}_proxy=http://10.218.0.210:8118
  if [[ $1 == "socks5" ]]; then
    export {http,https,all}_proxy=socks5://127.0.0.1:1080
  fi
}
setproxy

ubuntu () {
  incus exec ubuntu -- /bin/bash
}

flushrc () {
  __debug=true
  source /home/aromate/.bashrc
  __debug=false
}
