#!/bin/zsh

# git aliases
alias ga="git add"
alias gac="git commit -a "
alias gacm="git commit -a -m"
alias gap="git add -p"
alias gb="git branch"
alias gbl="git for-each-ref --count=30 --sort=-committerdate refs/heads/ --format='%(refname:short)'"
alias gc="git commit -v"
alias gcam="git commit --amend"
alias gcb="git checkout -b"
alias gch="git checkout"
alias gcl="git clone"
alias gcm="git commit -m"
alias gd="git diff --color-moved"
alias gdm="git diff --color-moved origin/main"
alias gds="git diff --color-moved --staged"
alias gdt="git difftool"
alias gl="git log --graph --decorate"
alias gld="git log --all --graph --decorate --oneline --simplify-by-decoration"
alias glg="git log --graph --pretty=format:'%C(auto)%h -%d %s %Cgreen(%cr) %C(bold blue)<%an>%Creset' --abbrev-commit"
alias glf='git log --pretty=format:"%C(yellow)%h%Cred%d %Creset%s%Cblue [%cn]" --decorate --numstat'
alias glp="git log -p --decorate"
alias gls="git dlog"
alias gmt="nvim -c DiffviewOpen"
alias gmv="git mv"
alias gp='git push origin HEAD'
alias gpo='git push origin'
alias gpub='git pull --rebase=merges --prune origin'
alias gr="git rm"
alias grb="git rebase"
alias grh="git reset HEAD"
alias gs="git status -s"

# github functions
alias ghb="gh browse"

# git functions
function gacmp () {
  git commit -a -m "$*" && git push origin HEAD
}

function gcmp () {
  git commit -m "$*" && git push origin HEAD
}

function gm () {
  if currentBranch=$(git symbolic-ref --short -q HEAD)
  then
    git checkout "$1"
    pull
    git checkout $currentBranch
    git rebase "$1"
  else
    echo not on any branch
  fi
}

function gpf() {
  if [ -z $1 ]
  then echo "Need the name of the branch"
  else
    if [ "$1" == "main" ]
    then echo "Can't force push to main"
    else
      git push --force-with-lease origin $1
    fi
  fi
}

function gss () {
  git stash && git checkout "$1" && git stash pop
}

function grm() {
  CURRENT=`git rev-parse --abbrev-ref HEAD` # figures out the current branch
  git checkout main
  git pull
  git checkout $CURRENT
  git rebase main
}

function gu() {
  git fetch $1 --prune; git merge --ff-only $1/$2 || git rebase --rebase=merges $1/$2;
}

function gsearch() {
  git rev-list --all | xargs git grep -F "$*"
}
function gpu() {
  git pull origin $(git rev-parse --abbrev-ref HEAD)
}
