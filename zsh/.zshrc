HISTFILE=~/.histfile
HISTSIZE=10000
SAVEHIST=10000
ZVM_CURSOR_STYLE_ENABLED=true
ZVM_INSERT_MODE_CURSOR=$ZVM_CURSOR_BEAM
ZVM_NORMAL_MODE_CURSOR=$ZVM_CURSOR_BLOCK
ZVM_VISUAL_MODE_CURSOR=$ZVM_CURSOR_UNDERLINE
ZVM_VISUAL_LINE_MODE_CURSOR=$ZVM_CURSOR_UNDERLINE


export EDITOR="nvim"

setopt autocd extendedglob
setopt HIST_IGNORE_DUPS
setopt SHARE_HISTORY

bindkey -v

source ~/.antidote/antidote.zsh
antidote load

autoload -Uz compinit && compinit
zstyle ':completion:*' menu no
# zstyle ':completion:*' matcher-list 'm:{a-z}={A-Z}'  # case insensitive
zstyle ':completion:*' matcher-list 'm:{a-zA-Z}={A-Za-z}' 'r:|=*' 'l:|=* r:|=*' # full fuzzy matching
zstyle ':completion:*' list-colors "${(s.:.)LS_COLORS}"  # colored menu

function zvm_after_init() {
  bindkey '^f' autosuggest-accept
}

alias cd="z"
alias ls='ls --color=auto'
alias grep='grep --color=auto'
alias lr='ls -RA'
alias la='ls -A'
alias g="z"
alias nvi="nvim"
alias py="python"
alias hx="helix"
alias mcsrr="mcsr -r"

function y() {
	local tmp="$(mktemp -t "yazi-cwd.XXXXXX")" cwd
	command yazi "$@" --cwd-file="$tmp"
	IFS= read -r -d '' cwd < "$tmp"
	[ "$cwd" != "$PWD" ] && [ -d "$cwd" ] && builtin cd -- "$cwd"
	rm -f -- "$tmp"
}

eval "$(zellij setup --generate-auto-start zsh)"
eval "$(starship init zsh)"
eval "$(zoxide init zsh)"
