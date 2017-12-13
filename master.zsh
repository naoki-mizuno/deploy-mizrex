#!/usr/bin/env zsh

local root="${${(%):-%N}:a:h}"
local init_cmd_path="$commands[deploy-mizrex]"

cd $root

if ! [[ -L $init_cmd_path ]]; then
    ln -sf ${root}/deploy_mizrex.zsh "$init_cmd_path"
fi

zsh src/setup_sh_spur_ros.zsh

echo 'Done!'
