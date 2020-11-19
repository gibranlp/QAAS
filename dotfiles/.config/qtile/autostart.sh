#!/usr/bin/env bash
#------------------------------------------------------------------------#

#                        mmmm
#   mmm                 m"  "m
#  #" "#                #    #
#  #   #                #    #
#  "#m#"                 #mm#
#
#        """""""""""""
# Autoinicio para Qtile

#------------------------------------------------------------------------#

## Creado por GIBRANLP 2020
## Cualquier cosa --> info@gibranlp.dev
## No sólo ejecutes este script, analiza o__O Investiga!
## ¡Aprende y Diviertete!
#------------------------------------------------------------------------#

setxkbmap -layout us -variant intl &
picom --config /home/gibranlp/.config/qtile/picom.conf &
numlockx on &
nextcloud &
nm-applet &
kdeconnect-indicator &
rand &
qtile-cmd -o cmd -f restart &

