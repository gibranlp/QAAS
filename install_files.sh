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
function home(){
  #cp -R ~/QAAS/dotfiles/.oh-my-zsh ~/.oh-my-zsh
  cp ~/QAAS/dotfiles/.Xdefaults ~/.Xdefaults
  cp ~/QAAS/dotfiles/.zshrc ~/.zshrc
  sudo cp ~/Cloud/gibranlp/identidad/logo/logo.png /usr/share/pixmaps/glp-icon.png
  sudo cp ~/Cloud/wallPapers/login.png /usr/share/backgrounds/anarchy/login.png
  sudo cp -R ~/QAAS/.themes/Kripton /usr/share/themes
  FILE=~/.config/ranger
    if [ -d "$FILE" ]; then
      cp ~/QAAS/dotfiles/.config/ranger/rc.conf ~/.config/ranger/rc.conf
    else
      mkdir ~/.config/ranger
      cp ~/QAAS/dotfiles/.config/ranger/rc.conf ~/.config/ranger/rc.conf
    fi

  FILE=~/.themes
    if [ -d "$FILE" ]; then
      cp -R ~/QAAS/.themes/Kripton ~/.themes
    else
      mkdir ~/.themes
      cp -R ~/QAAS/.themes/Kripton /usr/share/themes
    fi

    FILE=/opt/bin
      if [ -d "$FILE" ]; then
        sudo cp ~/QAAS/dotfiles/rand /opt/bin/rand
      else
        sudo mkdir /opt/bin
        sudo cp ~/QAAS/dotfiles/rand /opt/bin/rand
      fi

}

function qtile(){
  FILE=~/.config/qtile
    if [ -d "$FILE" ]; then
      cp ~/QAAS/dotfiles/.config/qtile/autostart.sh ~/.config/qtile/autostart.sh
      cd ~/.config/qtile/
      chmod +x autostart.sh
      cp ~/QAAS/dotfiles/.config/qtile/config.py ~/.config/qtile/config.py
      cp ~/QAAS/dotfiles/.config/qtile/picom.conf ~/.config/qtile/picom.conf
    else
      mkdir ~/.config/qtile
      cp ~/QAAS/dotfiles/.config/qtile/autostart.sh ~/.config/qtile/autostart.sh
      cd ~/.config/qtile/
      chmod +x autostart.sh
      cp ~/QAAS/dotfiles/.config/qtile/config.py ~/.config/qtile/config.py
      cp ~/QAAS/dotfiles/.config/qtile/picom.conf ~/.config/qtile/picom.conf
    fi
}

function ranger(){
  FILE=~/.config/ranger
    if [ -d "$FILE" ]; then
      cp ~/QAAS/dotfiles/.config/ranger/rc.conf ~/.config/ranger/rc.conf
    else
      mkdir ~/.config/ranger
      cp ~/QAAS/dotfiles/.config/ranger/rc.conf ~/.config/ranger/rc.conf
    fi
}

function rofi(){
  FILE=~/.config/rofi
    if [ -d "$FILE" ]; then
      cp ~/QAAS/dotfiles/.config/rofi/config ~/.config/rofi/config
      cp ~/QAAS/dotfiles/.config/rofi/config.rasi ~/.config/rofi/config.rasi
      cp ~/QAAS/dotfiles/.config/rofi/config.wpgtk ~/.config/rofi/config.wpgtk
    else
      mkdir ~/.config/rofi
      cp ~/QAAS/dotfiles/.config/rofi/config ~/.config/rofi/config
      cp ~/QAAS/dotfiles/.config/rofi/config.rasi ~/.config/rofi/config.rasi
      cp ~/QAAS/dotfiles/.config/rofi/config.wpgtk ~/.config/rofi/config.wpgtk
    fi
}

function extras(){
  cp ~/Cloud/gibranlp/identidad/logo/logo.png ~/.face
  #cp -r /QAAS/dotfiles/.oh-my-zsh ~/.oh-my-zsh
}


# Actual Program
home
qtile
ranger
rofi
extras
