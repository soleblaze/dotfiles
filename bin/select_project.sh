#!/bin/bash
set -eo pipefail

if ! [ "$1" ]; then
  echo "Missing project name"
  exit 1
fi

ROOTDIR="$HOME/projects"
PROJECT="$1"

if ! [[ -d "$ROOTDIR/$PROJECT" ]]; then
  if [[ "$PROJECT_REPO_BASE" ]]; then
    echo "What repo do you want to use? (${PROJECT_REPO_BASE})"
  else
    PROJECT_REPO_BASE=""
    echo "What repo do you want to use?"
  fi

  # Get a list of repos from the user
  repos=()
  while IFS= read -r line; do
    [[ $line ]] || break
    repos+=("$line")
  done

  echo "Which branch do you want to base your PR on?"
  read -e -r branch
  [[ "$branch" ]] || branch=zdefaultz

  mkdir -p "${ROOTDIR}/${PROJECT}"
  cd "${ROOTDIR}/${PROJECT}" || exit
  for repo in "${repos[@]}"; do
    repodir="$(echo "${repo##*/}" | cut -d. -f1)"
    git clone "${PROJECT_REPO_BASE}${repo}" "$repodir"

    pushd "$repodir" >/dev/null || exit
    if [[ "$branch" != "zdefaultz" ]]; then
      git checkout "$branch"
    fi
    git checkout -b "${PROJECT}"
    popd || exit
  done

  note="${ROOTDIR}/notes/${PROJECT}.md"
  if ! [[ -f "${note}" ]]; then
    echo -e "# Project: ${PROJECT}\n" >"${note}"
    if [[ "$JIRA_AUTH_TYPE" ]]; then
      echo -e "## Jira\n" >>"${note}"
      jira issue view "${PROJECT}" >>"${note}"
    fi
  fi
fi

smug start project PROJECT="${PROJECT}"
tmux switch -t "${PROJECT}"
