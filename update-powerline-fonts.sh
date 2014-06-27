#!/bin/bash

mkdir -p ~/.fonts ~/.config/fontconfig/conf.d

echo "updating powerline fonts..."
curl -# -L https://github.com/Lokaltog/powerline/raw/develop/font/PowerlineSymbols.otf > ~/.fonts/PowerlineSymbols.otf
curl -# -L https://github.com/Lokaltog/powerline/raw/develop/font/10-powerline-symbols.conf > ~/.config/fontconfig/conf.d/10-powerline-symbols.conf
fc-cache -vf ~/.fonts
