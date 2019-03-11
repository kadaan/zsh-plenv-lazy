# Lazy load plenv
if type plenv &> /dev/null; then
  local P;ENV_SHIMS="${PLENV_ROOT:-${HOME}/.plenv}/shims"
  export PATH="${PLENV_SHIMS}:${PATH}"
  source $(dirname $(greadlink -f `whence -p plenv`))/../completions/plenv.zsh
  function plenv() {
    unset -f plenv > /dev/null 2>&1
    eval "$(command plenv init -)"
    plenv "$@"
  }
fi
