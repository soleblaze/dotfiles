#!/bin/zsh

function title-precmd() {

  if  git rev-parse --show-toplevel >/dev/null 2>&1; then
    GIT_BASE=$(basename $(git rev-parse --show-toplevel))

    if [[ "$PROJECT" ]]; then
      print -Pn "\e]2;\[${(q)PROJECT}\] GIT - ${(q)GIT_BASE}\a"
    else
      print -Pn "\e]2;GIT - ${(q)GIT_BASE}\a"
    fi
  else
    if [[ "$PROJECT" ]]; then
      print -Pn "\e]2;\[${(q)PROJECT}\] %d\a"
    else
      print -Pn "\e]2;%d\a"
    fi
  fi
}

function title-preexec() {
  if [[ "$PROJECT" ]]; then
    print -Pn "\e]2;\[${(q)PROJECT}\] ${(q)1}\a"
  else
    print -Pn "\e]2;${(q)1}\a"
  fi

}

autoload -Uz add-zsh-hook

if [[ "$TERM" == (foot*|kitty*|screen*|tmux*|xterm*) ]]; then
	add-zsh-hook -Uz precmd title-precmd
	add-zsh-hook -Uz preexec title-preexec
fi
