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
picom --config ~/.config/qtile/picom.conf &
numlockx on &
nextcloud &
kdeconnect-indicator &
ip addr show | awk '/inet.*brd/{print $NF; exit}' | tee ~/.config/qtile/actnet &
rand &
qtile-cmd -o cmd -f restart &

