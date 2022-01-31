export PYENV_ROOT="$HOME/.pyenv"
export PATH="$PYENV_ROOT/bin:$PATH"
eval "$(pyenv init --path)"

export GTK_IM_MODULE=kime
export QT_IM_MODULE=kime
export XMODIFIERS=@im=kime
