#!/usr/bin/env bash
emerge x11-apps/xinit
emerge x11-base/xorg-server
emerge x11-apps/xsetroot
emerge x11-apps/xrandr
emerge x11-apps/setxkbmap
usermod -aG video,input,tty aleksic

emerge x11-libs/libX11 
emerge x11-libs/libXext 
emerge x11-libs/libXrender 
emerge x11-libs/libXt

git clone https://github.com/Soft/xcolor
cd xcolor
cargo install --path .
cp ./target/release/xcolor /usr/bin
cd ..
rm -rf xcolor

git clone https://github.com/astrand/xclip
cd xclip
autoreconf
./configure
make
make install
make install.man
cd ..
rm -rf xclip
