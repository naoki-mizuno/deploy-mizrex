#!/usr/bin/env zsh

local repo_url=https://github.com/naoki-mizuno/sh_spur_ros
local location=~/src/clones/naoki-mizuno/sh_spur_ros
local catkin_ws=${ROS_CATKIN_WS:-~/ros}

if (( $+commands[git] == 0 )); then
    echo 'git command not found' >&2
    exit 1
fi

git clone $repo_url $location
ln -sf $location $catkin_ws/src/sh_spur_ros
( cd $catkin_ws && catkin_make )
