#!/usr/bin/env bash
emerge flatpak
emerge flatpak-builder
flatpak remote-add --if-not-exists flathub https://flathub.org/repo/flathub.flatpakrepo

