
_add_to_env () {
  local env=$1
  local var=$2
  if [[ ! "${!env}" =~ "$var" ]]; then
    export $env=$var:${!env}
  fi
}

_add_to_path_env () {
  _add_to_env PATH $1
}

export GOPATH=$HOME/.go
export PYENV_ROOT=$HOME/.pyenv
export GO_BIN=$HOME/.local/bin
export RUST_BIN=$HOME/.cargo/bin
export GTK_IM_MODULE=fcitx
export QT_IM_MODULE=fcitx
export XMODIFIERS=@im=fcitx

_add_to_path_env $HOME/depot_tools
_add_to_path_env $GOPATH/bin
_add_to_path_env $RUST_BIN
_add_to_path_env $PYENV_ROOT/bin
_add_to_path_env $HOME/.local/bin
