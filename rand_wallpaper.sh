#!/usr/bin/env bash
#------------------------------------------------------------------------#

#                        mmmm
#   mmm                 m"  "m
#  #" "#                #    #
#  #   #                #    #
#  "#m#"                 #mm#
#
#        """""""""""""
# Post Instalador para Anarchy Linux

#------------------------------------------------------------------------#

## Creado por GIBRANLP 2020
## Cualquier cosa --> info@gibranlp.dev
## No sólo ejecutes este script, analiza o__O Investiga!
## ¡Aprende y Diviertete!

#------------------------------------------------------------------------#

function rand_wall (){
  dir='/home/gibranlp/MEGA/wallPapers/'
  wal -a 85 -i "${dir[RANDOM % ${#dir[@]}]}" -q  &
  qtile-cmd -o cmd -f restart &
}

rand_wall
