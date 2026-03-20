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

alias ls='ls --color=auto'
alias grep='grep --color=auto'
alias lr='ls -RA'
alias la='ls -A'
alias g="cd"
alias nvi="nvim"
alias py="python"
alias hx="helix"
eval "$(zellij setup --generate-auto-start zsh)"
eval "$(starship init zsh)"
