export LANG=ja_JP.UTF-8
export EDITOR=vim
alias ls='ls -Gv'
alias ll='ls -al'
alias df='df -k'
alias activate="source .venv/bin/activate"
alias gcurl='curl -H "Authorization: Bearer $(gcloud auth application-default print-access-token)" -H "Content-Type: application/json"'
alias fprank="/Users/kazuki/Develop/tools/search_rank/fprank"

# autoload
autoload -U compinit
compinit -u
# prompt
PROMPT="[${USER}] %(!.#.$) "
PROMPT2="%_%% "
RPROMPT="[%~]"
SPROMPT="%r is correct? [n,y,a,e]: "
# history
HISTFILE=~/.zsh_history
HISTSIZE=10000
SAVEHIST=10000
setopt HIST_IGNORE_DUPS HIST_REDUCE_BLANKS INC_APPEND_HISTORY SHARE_HISTORY
# keybind
bindkey -e
# history C-p C-n
autoload history-search-end
zle -N history-beginning-search-backward-end history-search-end
zle -N history-beginning-search-forward-end history-search-end
bindkey "^P" history-beginning-search-backward-end
bindkey "^N" history-beginning-search-forward-end
# auto cd
setopt auto_cd
# auto push
setopt auto_pushd
# list pack
setopt list_packed
# japanese
setopt print_eight_bit
# no beep
setopt no_beep
## terminal configuration
unset LSCOLORS
case "${TERM}" in
rxvt*|kterm*|xterm*|screen*)
  precmd() {
    echo -ne "\033]0;${USER}@${HOST%%.*}:${PWD}\007"
  }
  export LSCOLORS=gxfxcxdxbxegedabagacad
  export LS_COLORS='di=36:ln=35:so=32:pi=33:ex=31:bd=46;34:cd=43;34:su=41;30:sg=46;30:tw=42;30:ow=43;30'
  zstyle ':completion:*' list-colors \
    'di=36' 'ln=35' 'so=32' 'ex=31' 'bd=46;34' 'cd=43;34'
  ;;
esac

#zstyle ':completion:*' list-colors ${(s.:.)LSCOLORS}
# slash
setopt noautoremoveslash
# 大文字小文字
zstyle ':completion:*' matcher-list 'm:{a-z}={A-Z}'

# bun completions
[ -s "/Users/kazuki/.bun/_bun" ] && source "/Users/kazuki/.bun/_bun"

# pyenv
eval "$(pyenv init --path)"

# goenv
eval "$(goenv init -)"

# nodenv
eval "$(nodenv init -)"

# The next line updates PATH for the Google Cloud SDK.
if [ -f '/Users/kazuki/google-cloud-sdk/path.zsh.inc' ]; then . '/Users/kazuki/google-cloud-sdk/path.zsh.inc'; fi

# The next line enables shell command completion for gcloud.
if [ -f '/Users/kazuki/google-cloud-sdk/completion.zsh.inc' ]; then . '/Users/kazuki/google-cloud-sdk/completion.zsh.inc'; fi

export PATH="/opt/homebrew/opt/mysql-client/bin/:$PATH"
export LDFLAGS="-L/opt/homebrew/opt/openblas/lib"
export CPPFLAGS="-I/opt/homebrew/opt/openblas/include"
# The following lines have been added by Docker Desktop to enable Docker CLI completions.
fpath=(/Users/kazuki/.docker/completions $fpath)
autoload -Uz compinit
compinit
# End of Docker CLI completions
