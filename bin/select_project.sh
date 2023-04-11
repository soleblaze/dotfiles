#!/bin/bash
set -eo pipefail

if ! [ "$1" ]; then
  echo "Missing project name"
  exit 1
fi

ROOTDIR="$HOME/projects"
PROJECT="$1"
TITLE="[$PROJECT]"

# Takes the basic size of the header and adds the length of the title to it
calculate_length() {
  local hex_number=$1
  local decimal_number=${#TITLE}
  local integer_hex_number=$((16#$hex_number))
  local result=$((integer_hex_number + decimal_number))
  printf "%02x" $result
}

# Generate a rule to match title strings
generate_rule() {
  LENGTH="$(calculate_length 00)"
  LENGTH1="$(calculate_length 1D)"
  LENGTH2="$(calculate_length 19)"
  LENGTH3="$(calculate_length 17)"
  LENGTH4="$(calculate_length 04)"
  LENGTH5="$(calculate_length 02)"
  STRINGHEX=$(echo -ne "${TITLE}" | xxd -p)
  echo "0a${LENGTH1}080112${LENGTH2}12${LENGTH3}08631a0922070a057469746c6522${LENGTH4}0a${LENGTH5}0a${LENGTH}${STRINGHEX}2a020102" | xxd -r -p | base64
}

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

  # Create project
  osascript <<EOD
tell application "TimingHelper"
	set results to projects whose name is "$PROJECT"
	if results = {} then
		set ParentProjects to (projects whose name is "projects")
		set ParentProject to first item in ParentProjects
		create project name "$PROJECT" parent project ParentProject productivity rating 1 rule data "$(generate_rule)"
	end if
end tell
EOD
fi

smug start project PROJECT="${PROJECT}"
tmux switch -t "${PROJECT}"
