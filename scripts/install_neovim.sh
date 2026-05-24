#!/bin/sh

curl -L https://github.com/neovim/neovim/releases/latest/download/nvim-linux-x86_64.appimage -o nvim \
    && mv nvim ~/.local/bin/nvim \
    && chmod +x ~/.local/bin/nvim
