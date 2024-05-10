#!/usr/bin/zsh

if [ $commands[recoll] ]; then
  alias rt="recoll -t"
  alias rdt="recoll -d -t"
  alias rpdf="recoll -t ext:pdf"
  alias rtxt="recoll -t ext:txt"
  alias rmd="recoll -t ext:md"
  alias fzf="fzf --color='bg+:33,hl:12,hl+:208'"

  function ort {
      xdg-open "$(recoll -t "$*" | grep file | awk -F'\t' '{print $2}' |\
      tr -d '[]' | sed 's|file://||' | fzf)"
  }
  function ordt {
      xdg-open "$(recoll -d -t "$*" | grep file | awk -F'\t' '{print $2}' |\
      tr -d '[]' | sed 's|file://||' | fzf)"
  }
  function orpdf {
      xdg-open "$(recoll -t ext:pdf "$*" | grep file | awk -F'\t' '{print $2}' |\
      tr -d '[]' | sed 's|file://||' | fzf)"
  }
  function ortxt {
      xdg-open "$(recoll -t ext:txt "$*" | grep file | awk -F'\t' '{print $2}' |\
      tr -d '[]' | sed 's|file://||' | fzf)"
  }
  function ormd {
      xdg-open "$(recoll -t ext:md "$*" | grep file | awk -F'\t' '{print $2}' |\
      tr -d '[]' | sed 's|file://||' | fzf)"
  }
fi
