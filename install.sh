#!/bin/bash

set -eux

DOTFILES_ROOT=$(dirname $(readlink -f $0))
cd $DOTFILES_ROOT

DOTFILES=$(cat << EOF
.gitconfig
.config/git/ignore
.config/rstudio
.bashrc
.ssh/config
EOF
)

for DOTFILE in $DOTFILES
do
    LINK_PATH="/home/rstudio/$DOTFILE"
    FILE_PATH="$DOTFILES_ROOT/$DOTFILE"
    mkdir -p $(dirname $LINK_PATH)
    ln -sfnv "$FILE_PATH" "$LINK_PATH"
done
