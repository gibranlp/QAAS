#!/usr/bin/env bash
#------------------------------------------------------------------------#

#                        mmmm
#   mmm                 m"  "m
#  #" "#                #    #
#  #   #                #    #
#  "#m#"                 #mm#
#
#        """""""""""""
# Archivo de configuración para Qtile.

#------------------------------------------------------------------------#

## Creado por GIBRANLP 2020
## Cualquier cosa --> info@gibranlp.dev
## No sólo ejecutes este script, analiza o__O Investiga!
## ¡Aprende y Diviertete!

#------------------------------------------------------------------------#

function cpf(){

#Copy files to make backup on github
  \cp ~/rand ~/QAAS/dotfiles/
  \cp ~/.zshrc ~/QAAS/dotfiles/
  \cp -R ~/.oh-my-zsh ~/QAAS/dotfiles/
  \cp -R ~/.config/qtile ~/QAAS/dotfiles/.config/
  \cp -R ~/.config/rofi/ ~/QAAS/dotfiles/.config/
}

cpf
