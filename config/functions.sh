unsetproxy() {
  unset http_proxy
  unset https_proxy
  unset all_proxy
}

setproxy() {
  if [[ $# == "1" ]]; then
    export {http,https,all}_proxy=http://127.0.0.1:8118
  else
    if [[ $1 == "socks5" ]]; then
      export {http,https,all}_proxy=socks5://127.0.0.1:1080
    fi
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
