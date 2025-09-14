#!/usr/bin/env bash
emerge app-eselect/eselect-repository dev-vcs/git
eselect repository add brave-overlay git https://gitlab.com/jason.oliveira/brave-overlay.git
eselect repository enable brave-overlay
eselect repository enable pentoo
eselect repository enable nest
emerge --sync
