#!/bin/bash

# xloadimage -onroot -fullscreen ~/.bg/masterpiece.png
#feh --bg-scale ~/.bg/tokyo1.jpg

# Set mouse pointer
xsetroot -cursor_name left_ptr

xmodmap ~/.xmodmap

# To make urxvt use .Xresources
xrdb -merge ~/.Xresources

udiskie &

exec xmonad
