#!/usr/bin/bash

if command -v "nvim" >/dev/null; then
	EDITOR="nvim"
else
	EDITOR="vim"
fi

export PSQL_EDITOR=$EDITOR

# pager, use bat if present
if command -v bat >/dev/null; then
	export PAGER=bat
fi

# FZF options
if type rg &>/dev/null; then
	export FZF_DEFAULT_COMMANND='rg --files'
	export FZF_DEFAULT_OPTS='-m'
fi

export FZF_DEFAULT_OPTS='--height 80% --layout=reverse --border --margin=1'

if [[ -f $HOME/.fzf.bash ]]; then
	source "$HOME/.fzf.bash"
fi

# yarn
if command -v yarn &>/dev/null; then
	yarn_bin=$(yarn global bin)
	PATH=$PATH:$yarn_bin
fi

export NVM_DIR="$HOME/.nvm"
[ -s "$NVM_DIR/nvm.sh" ] && \. "$NVM_DIR/nvm.sh"  # This loads nvm
[ -s "$NVM_DIR/bash_completion" ] && \. "$NVM_DIR/bash_completion"  # This loads nvm bash_completion

# go
if [[ -d /usr/local/go ]]; then
	PATH=$PATH:/usr/local/go/bin
	PATH=$PATH:$(go env GOPATH)/bin
fi

# pyenv
if [[ -d "$HOME/.pyenv" ]]; then
	export PYENV_ROOT="$HOME/.pyenv"
	PATH=$PATH:$PYENV_ROOT/bin
	eval "$(pyenv init -)"
fi

# source cargo
if [[ -f "$HOME/.cargo/env" ]]; then
	. "$HOME/.cargo/env"
fi

if [[ -d "$HOME/local/bin" ]]; then
    PATH="$HOME/local/bin:$PATH"
fi

export PATH
