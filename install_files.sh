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
  cp -R ~/QAAS/dotfiles/.xinitrc ~/.xinitrc
  cp ~/QAAS/dotfiles/.Xdefaults ~/.Xdefaults
  sudo cp -R ~/QAAS/dotfiles/.themes/darky_pink /usr/share/slim/themes/
  sudo cp ~/Cloud/gibranlp/identidad/logo/logo.png /usr/share/pixmaps/glp-icon.png
  sudo cp ~/Pictures/wallPapers/login.png /usr/share/backgrounds/anarchy/login.png
  sudo cp -R ~/QAAS/dotfiles/.themes/Kripton /usr/share/themes

  FILE=~/.config/ranger
    if [ -d "$FILE" ]; then
      cp ~/QAAS/dotfiles/.config/ranger/rc.conf ~/.config/ranger/rc.conf
    else
      mkdir ~/.config/ranger
      cp ~/QAAS/dotfiles/.config/ranger/rc.conf ~/.config/ranger/rc.conf
    fi

  FILE=~/.themes
   if [ -d "$FILE" ]; then
      cp -R ~/QAAS/dotfiles/.themes/Kripton ~/.themes
   else
      mkdir ~/.themes
      cp -R ~/QAAS/dotfiles/.themes/Kripton /usr/share/themes
   fi


  FILE=~/.fonts
    if [ -d "$FILE" ]; then
      cp -R ~/QAAS/dotfiles/.fonts ~/.fonts
    else
      mkdir ~/.themes
      cp -R ~/QAAS/dotfiles/.fonts ~/.fonts
    fi

    FILE=~/Pictures/wallPapers
    if [ -d "$FILE" ]; then
      rm -rf /Pictures/wallPapers
      mkdir ~/Pictures/wallPapers
      cp -R ~/QAAS/wallPapers/dark ~/Pictures/wallPapers
      cp -R ~/QAAS/wallPapers/white ~/Pictures/wallPapers
    else
      mkdir ~/Pictures/wallPapers
       cp -R ~/QAAS/wallPapers/dark ~/Pictures/wallPapers
      cp -R ~/QAAS/wallPapers/white ~/Pictures/wallPapers
    fi

    FILE=/opt/bin
      if [ -d "$FILE" ]; then
        sudo cp ~/QAAS/dotfiles/rand /opt/bin/rand
        sudo ln -s /opt/bin/rand /usr/bin/rand
        sudo chmod 755 /opt/bin/rand

        sudo cp ~/QAAS/dotfiles/randw /opt/bin/randw
        sudo ln -s /opt/bin/randw /usr/bin/randw
        sudo chmod 755 /opt/bin/randw
        
        sudo cp ~/QAAS/dotfiles/wsearch /opt/bin/wsearch
        sudo ln -s /opt/bin/wsearch /usr/bin/wsearch
        sudo chmod 755 /opt/bin/wsearch

        sudo cp ~/QAAS/dotfiles/wvis /opt/bin/wvis
        sudo ln -s /opt/bin/wvis /usr/bin/wvis
        sudo chmod 755 /opt/bin/wvis

        sudo cp ~/QAAS/network /opt/bin/network
        sudo ln -s /opt/bin/network /usr/bin/network
        sudo chmod 755 /opt/bin/network
      else
        sudo mkdir /opt/bin
        
        sudo cp ~/QAAS/dotfiles/rand /opt/bin/rand
        sudo ln -s /opt/bin/rand /usr/bin/rand
        sudo chmod 755 /opt/bin/rand
        
        sudo cp ~/QAAS/dotfiles/randw /opt/bin/randw
        sudo ln -s /opt/bin/randw /usr/bin/randw
        sudo chmod 755 /opt/bin/randw
        
        sudo cp ~/QAAS/dotfiles/wsearch /opt/bin/wsearch
        sudo ln -s /opt/bin/wsearch /usr/bin/wsearch
        sudo chmod 755 /opt/bin/wsearch

        sudo cp ~/QAAS/dotfiles/wvis /opt/bin/wvis
        sudo ln -s /opt/bin/wvis /usr/bin/wvis
        sudo chmod 755 /opt/bin/wvis

        sudo cp ~/QAAS/network /opt/bin/network
        sudo ln -s /opt/bin/network /usr/bin/network
        sudo chmod 755 /opt/bin/network
      fi

      FILE=~/.icons
        if [ -d "$FILE" ]; then
          cp -R ~/QAAS/dotfiles/.icons/McMojave-cursors ~/.icons
        else
          mkdir ~/.themes
          cp -R ~/QAAS/dotfiles/.icons/McMojave-cursors ~/.icons
        fi

}
function vis(){
  FILE=~/.config/vis
    if [ -d "$FILE" ]; then
      cp -R ~/QAAS/dotfiles/.config/vis ~/.config/
    else
      mkdir ~/.config/vis
      mkdir ~/.config/vis/colors
      cp -R ~/QAAS/dotfiles/.config/vis ~/.config/
    fi
}



function qtile(){
  FILE=~/.config/qtile
    if [ -d "$FILE" ]; then
      cp ~/QAAS/dotfiles/.config/qtile/autostart.sh ~/.config/qtile/autostart.sh
      cp ~/QAAS/dotfiles/.config/qtile/alwaystart.sh ~/.config/qtile/alwaystart.sh
      cd ~/.config/qtile/
      chmod +x autostart.sh
      chmod +x alwaystart.sh
      cp ~/QAAS/dotfiles/.config/qtile/config.py ~/.config/qtile/config.py
      cp ~/QAAS/dotfiles/.config/qtile/picom.conf ~/.config/qtile/picom.conf
    else
      mkdir ~/.config/qtile
      cp ~/QAAS/dotfiles/.config/qtile/autostart.sh ~/.config/qtile/autostart.sh
      cp ~/QAAS/dotfiles/.config/qtile/alwaystart.sh ~/.config/qtile/alwaystart.sh
      cd ~/.config/qtile/
      chmod +x autostart.sh
      chmod +x alwaystart.sh
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
zsh
home
qtile
ranger
rofi
extras
vis