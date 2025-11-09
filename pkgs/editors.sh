#!/usr/bin/env bash
emerge app-editors/vim
emerge app-text/zathura
emerge app-text/zathura-pdf-poppler

cd "$HOME"/Github/
git clone https://github.com/neovim/neovim.git
cd neovim
git checkout master
git pull
make -j8 CMAKE_BUILD_TYPE=Release
make install

go install github.com/charmbracelet/glow@latest
cp "$HOME"/go/bin/glow /usr/local/bin
