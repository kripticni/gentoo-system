#!/usr/bin/env bash
eselect repository add brave-overlay git https://gitlab.com/jason.oliveira/brave-overlay.git
emerge --sync brave-overlay
emerge www-client/brave-bin::brave-overlay
