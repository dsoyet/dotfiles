#!/bin/bash

# Copyright 2022, MetaQuotes Ltd.

# MetaTrader download url
URL="https://download.mql5.com/cdn/web/metaquotes.software.corp/mt5/mt5setup.exe"

#mono for .net, geoko for IE
#arch
pacman -Sy wine-mono wine-gecko wine winetricks xorg-server-xvfb

#debian
sudo apt-get install xrdp icewm xfce4-terminal xvfb

sudo apt-get install xrdp icewm xfce4-terminal xvfb build-essential

sudo dpkg --add-architecture i386 && sudo apt update
winetricks -q mt5.verb

# Download MetaTrader
wget $URL

# Set environment to Windows 10
WINEPREFIX=~/.mt5 winecfg -v=win10
# Start MetaTrader installer
WINEPREFIX=~/.mt5 wine mt5setup.exe

#winecfg set dpi 192
