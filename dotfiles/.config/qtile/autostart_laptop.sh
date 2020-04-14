#!/usr/bin/env bash
#------------------------------------------------------------------------#

#                        mmmm
#   mmm                 m"  "m
#  #" "#                #    #
#  #   #                #    #
#  "#m#"                 #mm#
#
#        """""""""""""
# Auto inicio para Qtile

#------------------------------------------------------------------------#

## Creado por GIBRANLP 2020
## Cualquier cosa --> info@gibranlp.dev
## No sólo ejecutes este script, analiza o__O Investiga!
## ¡Aprende y Diviertete!

#------------------------------------------------------------------------#

##Variable del directorio en donde estan los wallpapers
dir='/home/gibranlp/MEGA/wallPapers/'
wal -i "${dir[RANDOM % ${#dir[@]}]}" -q  &
qtile-cmd -o cmd -f restart &
setxkbmap -layout us -variant intl &
nm-applet &
megasync &
picom &
numlockx on &
blueberry-tray &
