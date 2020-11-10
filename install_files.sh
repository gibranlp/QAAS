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
function zsh(){
  #sh -c "$(curl -fsSL https://raw.github.com/ohmyzsh/ohmyzsh/master/tools/install.sh)" -y
  #git clone https://github.com/zsh-users/zsh-autosuggestions.git $ZSH_CUSTOM/plugins/zsh-autosuggestions
  #git clone https://github.com/zsh-users/zsh-syntax-highlighting.git $ZSH_CUSTOM/plugins/zsh-syntax-highlighting

  cp ~/QAAS/dotfiles/.oh-my-zsh/themes/passion.zsh-theme ~/.oh-my-zsh/themes/passion.zsh-theme
  cp ~/QAAS/dotfiles/.zshrc ~/.zshrc
}

function home(){
  #cp -R ~/QAAS/dotfiles/.oh-my-zsh ~/.oh-my-zsh
  cp ~/QAAS/dotfiles/.Xdefaults ~/.Xdefaults
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

      FILE=~/.icons
        if [ -d "$FILE" ]; then
          cp -R ~/QAAS/.icons/McMojave-cursors ~/.icons
        else
          mkdir ~/.themes
          cp -R ~/QAAS/.icons/McMojave-cursors ~/.icons
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

function vim(){
  mkdir -p ~/.vim/pack/vendor/start
  git clone --depth 1 \
  https://github.com/preservim/nerdtree.git \
  ~/.vim/pack/vendor/start/nerdtree

}


# Actual Program
zsh
home
qtile
ranger
rofi
extras
