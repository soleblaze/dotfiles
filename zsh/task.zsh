#!/bin/zsh
if  [ $commands[task] ]; then
  alias ta="task add"
  alias th="task history"
  alias tl="task ls"
  alias tln="task ls tag:next"
  alias tn="task next"
  alias tp="task projects"
  alias tsum="task summary"

  function td {
  task $1 done

  if grep -q "^taskd" $HOME/.config/task/taskrc; then
  task sync
  fi
  }

  function tlater {
  task $1 modify +later

  if grep -q "^taskd" $HOME/.config/task/taskrc; then
  task sync
  fi
  }
  function tdel {
  task $1 delete

  if grep -q "^taskd" $HOME/.config/task/taskrc; then
  task sync
  fi
  }

  function tap {
  task add project:$*

  if grep -q "^taskd" $HOME/.config/task/taskrc; then
  task sync
  fi
  }

  function tas {
  task add project:singletons $*

  if grep -q "^taskd" $HOME/.config/task/taskrc; then
  task sync
  fi
  }

  function tlp {
  task ls project:$*
  }

  function tdep {
  task $1 modify depends:"$2"

  if grep -q "^taskd" $HOME/.config/task/taskrc; then
  task sync
  fi
  }

  # Autocomplete

  zstyle ':completion:*:*:task:*' verbose yes
  zstyle ':completion:*:*:task:*:descriptions' format '%U%B%d%b%u'
  zstyle ':completion:*:*:task:*' group-name ''
  compdef _task t=task
fi
