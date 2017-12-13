#!/usr/bin/env zsh

local root="${${(%):-%N}:a:h}"

cd $root

zsh src/setup_sh_spur_ros.zsh

echo 'Done!'
