#!/usr/bin/env bash
emerge --sync
emerge --update --deep --newuse --quiet --autounmask-continue=y @world
