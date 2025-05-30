#!/bin/zsh

function mount_directory {
    flags="-o reconnect -o delay_connect -o follow_symlinks -o uid=504 -o gid=20 -o workaround=rename:renamexdev:truncate:fstat:buflimit:createmode"
    source_path="$1"
    target_path="$2"

    eval "sshfs xn124:$source_path $target_path $flags"
}

if [ $# -lt 2 ];
    echo "Usage: $0 <source_path> <target_path>"
    exit 1
fi

mount_directory "$@""
