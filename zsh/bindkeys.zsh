#!/bin/zsh

# Use emacs mode
bindkey -e
# Setup substring search
## Set Bind Keys if tmux/screen is running
bindkey '^[[A' history-substring-search-up
bindkey '^[[B' history-substring-search-down
zmodload zsh/terminfo
bindkey "$terminfo[kcuu1]" history-substring-search-up
bindkey "$terminfo[kcud1]" history-substring-search-down

#bind keys
bindkey "\e[1~" beginning-of-line # Home
bindkey "\e[4~" end-of-line # End
bindkey "\e[5~" beginning-of-history # PageUp
bindkey "\e[6~" end-of-history # PageDown
bindkey "\e[2~" quoted-insert # Ins
bindkey "\e[3~" delete-char # Del
bindkey "\e[Z" reverse-menu-complete # Shift+n
bindkey '^P' up-history
bindkey '^N' down-history
bindkey '^r' history-incremental-search-backward
bindkey '^A' beginning-of-line
bindkey '^E' end-of-line

backward-delete-local () {
  local WORDCHARS='*?_[]~/&;!#$%^(){}<>,"'"'"
  zle .backward-delete-word
}
zle -N backward-delete-local
bindkey '^w' backward-delete-local

backward-word-local () {
  local WORDCHARS='*?_[]~/&;!#$%^(){}<>,"'"'"
  zle .backward-word
}
zle -N backward-word-local
bindkey '^b' backward-word-local

forward-word-local () {
  local WORDCHARS='*?_[]~/&;!#$%^(){}<>,"'"'"
  zle .forward-word
}
zle -N forward-word-local
bindkey '^f' forward-word-local
