#!/usr/bin/env zsh

local repo_name='naoki-mizuno/deploy-mizrex'
local repo_url="https://github.com/$repo_name"
local repo_clone_dir="$HOME/src/clones/$repo_name"
local update=true

while getopts 'hn' flag; do
    case "$flag" in
        n)
            update=false
            ;;
        h)
            echo "Usage: $0 [-h] [-n]"
            exit 0
    esac

done
shift $(( $OPTIND - 1 ))

autoload -Uz colors
colors

if ! [[ -e $repo_clone_dir ]]; then
    command git clone $repo_url $repo_clone_dir
elif $update; then
    echo "Updating ${repo_name}"
    ( cd $repo_clone_dir && command git reset --hard && command git pull --quiet origin master )
fi

if ! [[ -e $repo_clone_dir/master.zsh ]]; then
    echo "${fg[red]}master.zsh not found in ${repo_name}${reset_color}" >&2
    echo "${fg[red]}Please contact the owner of the repo at $repo_url/issues${reset_color}" >&2
    exit 1
fi

exec zsh $repo_clone_dir/master.zsh ${argv[@]}
