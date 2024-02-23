__bashrc_dir=$(cd -- "$(dirname -- "${BASH_SOURCE[0]}")" &>/dev/null && pwd)

[ "${__debug}" == "true" ] || __debug=false

if [[ "${BLE_VERSION}" == "" || ${__debug} == "true" ]]; then
  for file in $(ls ${__bashrc_dir}/config/); do
    if [ "$__debug" = "true" ]; then
      echo "Loading ${file}"
    fi
    source ${__bashrc_dir}/config/$file
  done
fi

source $HOME/.local/share/blesh/ble.sh

if [[ ! -z "$hacknet" ]]; then
	export PS1="\[\033[31m\]Scope \u\[\033[01;34m\]@\h\[\033[01;34m\] \w \$\[\033[00m\] "
  unset http_proxy
  unset https_proxy
  unset all_proxy
fi

if [[ -z "$IS_VIM" ]]; then
  eval "$(starship init bash)"
fi
