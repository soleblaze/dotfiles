#!/bin/bash
set -euo pipefail

ROOTDIR="$HOME/projects"
PROJECT="$1"

if [[ -d "$ROOTDIR/$PROJECT" ]]; then
  smug start project PROJECT="${PROJECT}"
else
  if [[ "$PROJECT_REPO_BASE" ]]; then
    echo "What repo do you want to use? (${PROJECT_REPO_BASE})"
  else
    PROJECT_REPO_BASE=""
    echo "What repo do you want to use?"
  fi

  # Get a list of repos from the user
  IFS=$'\n' read -r -d $'\0' -a repos

  echo "Which branch do you want to base your PR on?"
  read -e -r -i zdefaultz branch

  mkdir -p "${ROOTDIR}/${PROJECT}"
  cd "${ROOTDIR}/${PROJECT}" || exit
  for repo in "${repos[@]}"; do
    git clone "${PROJECT_REPO_BASE}${repo}"
    pushd "${PROJECT_REPO_BASE}${repo}" >/dev/null
    if [[ "$branch" != "zdefaultz" ]]; then
      git checkout "$branch"
    fi
    git checkout -b "${PROJECT}"
    popd
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
