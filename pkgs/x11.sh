#!/usr/bin/env bash
emerge x11-apps/xinit
emerge x11-base/xorg-server
emerge x11-apps/xsetroot
emerge x11-apps/xrandr
emerge x11-apps/setxkbmap
emerge x11-apps/xinput
usermod -aG video,input,tty aleksic

emerge x11-libs/libX11 
emerge x11-libs/libXext 
emerge x11-libs/libXrender 
emerge x11-libs/libXt

git clone https://github.com/Soft/xcolor
cd xcolor || return
cargo install --path .
cp ./target/release/xcolor /usr/local/bin
cd ..

git clone https://github.com/astrand/xclip
cd xclip || return
autoreconf
./configure
make
make install
make install.man
cd ..

git clone https://github.com/robiot/xclicker
cd xclicker || return
make release
cp ./build/release/src/xclicker /usr/local/bin
cd ..
