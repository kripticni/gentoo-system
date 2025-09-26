#!/usr/bin/env bash
emerge net-im/discord
python ./scripts/disable-breaking-updates.py

eselect repository enable nest
emerge --sync
emerge net-im/viber

cd $HOME/Github
git clone https://github.com/Vencord/Vesktop
cd Vesktop

pnpm i
pnpm package
