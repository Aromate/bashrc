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
