_join_env () {
  local env=$1
  local var=$2
  if [[ ! "${!env}" =~ "$var" ]]; then
    export $env=$var:${!env}
  fi
}

_join_path_env () {
  if [[ -d $1 ]]; then
    _join_env PATH $1
  fi
}

export GO_BIN=$HOME/.local/bin
export GOPATH=$HOME/.go
_join_path_env $GOPATH/bin


export PYENV_ROOT=$HOME/.pyenv
export RUST_BIN=$HOME/.cargo/bin
_join_path_env $RUST_BIN

_join_path_env $HOME/depot_tools
_join_path_env $PYENV_ROOT/bin
_join_path_env $HOME/.local/bin
