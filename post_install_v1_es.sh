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


# Funciones

##Pausa
function pause(){
   read -p "$*"
}

##Actualizar
function f_update () {
    clear
    echo "#############################"
    echo "[=] Actualización del sistema"
    echo "[*] sudo pacman -Syu"
    echo "#############################"
    pause 'Presiona [ENTER] para continuar...'

    sudo pacman -Syu

    echo -e "\n###############################"
    echo "¡Listo el sistema se actualizó!"
    echo "###############################"
    pause 'Presiona [ENTER] para continuar...'
}

##Actualizar AUR
function f_aur () {
    clear
    echo "################################"
    echo "[=] Actualización de apps de AUR"
    echo "[*] yay"
    echo "################################"
    pause 'Presiona [ENTER] para continuar...'

    yay

    echo -e "\n#######################################"
    echo "¡Listo las APPs de AUR se actualizaron!"
    echo "#######################################"
    pause 'Presiona [ENTER] para continuar...'
}

##Instalar drivers nvidia
function f_nvidia () {
    clear
    echo "#####################################"
    echo "[=] Instalación de los Drivers Nvidia"
    echo "[*] sudo pacman -S nvidia"
    echo "#####################################"
    echo -e "\n La tarjeta actual del sistema es -->"
    lspci -k | grep -A 2 -i "VGA" # Ver que Tarjeta gŕafica estamos utilizando ahora.
    pause 'Presiona [ENTER] para continuar...'

    sudo pacman -S nvidia --noconfirm

    echo "####################################"
    echo "[=] Se instalaron los drivers Nvidia"
    echo "[=] Es necesario reiniciar."
    echo "####################################"
    echo -n "Reiniciar Sí/No";
    read ;
    if [[ "$REPLY" == "y" || "$REPLY" == "Y" ]]; then
      sudo reboot
    else
      echo "Continuando sin reiciar"
    fi
}

#Audio
function f_audio () {
    clear
    echo "#############################"
    echo "[=] Instalación de Pulseaudio"
    echo "#############################"
    pause 'Presiona [ENTER] para continuar...'

    packets=('alsa-utils' 'alsa-lib' 'alsa-firmware' 'gstreamer' 'gst-plugins-bad' 'gst-plugins-base' 'gst-plugins-ugly' 'alsa-plugins' 'pulseaudio' 'pulseaudio-alsa' 'pavucontrol' 'volumeicon')

    for packet in "${packets[@]}"; do
        echo "Instalando --> ${packet}"
        sudo pacman -S "${packet}" --noconfirm --needed
    done

    echo -e "\n###############################"
    echo "¡Pulseaudio ha sido instalado! "
    echo "###############################"
    pause 'Presiona [ENTER] para continuar...'
}

#Bletooth (Laptops)
function f_blue () {
    clear
    echo "#############################"
    echo "[=] Instalación de Bluetooth "
    echo "#############################"
    pause 'Presiona [ENTER] para continuar...'

    packets=('pulseaudio-bluetooth' 'bluez' 'bluez-libs' 'bluez-utils' 'blueberry')

    for packet in "${packets[@]}"; do
        echo "Instalando --> ${packet}"
        sudo pacman -S "${packet}" --noconfirm --needed
    done

    systemctl enable bluetooth.service || systemctl enable bluetooth.service

    sudo usermod  -a -G rfkill $USER

    echo -e "\n###############################"
    echo "¡BLuetooth ha sido instalado!  "
    echo "###############################"
    pause 'Presiona [ENTER] para continuar...'
  }

function f_software () {
  clear
  echo "#############################"
  echo "[=] Software                 "
  echo "#############################"

  packets=('picom' 'qtile' 'lshw' 'ttf-font-awesome' 'scrot' 'plank' 'rofi' 'python-pip' 'firefox' 'pkgfile' 'ranger' 'feh' 'xorg-server-xephyr' 'neofetch' 'transmission-gtk' 'atom' 'mplayer' 'gimp' 'lxappearance' 'lxsession' 'hexchat' 'numlockx' 'mvp' 'gnome-disk-utility' 'gparted' 'lightdm-webkit2-greeter' 'lightdm-webkit-theme-litarvan')

  for packet in "${packets[@]}"; do
      echo "Instalando --> ${packet}"
      sudo pacman -S "${packet}" --noconfirm --needed
  done

  echo -e "\n###############################"
  echo "¡El software ha sido instalado!"
  echo "###############################"
  pause 'Presiona [ENTER] para continuar...'

}

##Software AUR
function f_software_aur () {
  clear
  echo "#############################"
  echo "[=] AUR Software             "
  echo "#############################"

  sed -i "s/-j2/-j$(nproc)/;s/^#MAKEFLAGS/MAKEFLAGS/" /etc/makepkg.conf #Utilizar todos los cores para compilar

  packets=('tusk' 'ocs-url' 'dotfonts' 'minder-git' 'typora' 'onlyoffice-bin' 'fontpreview-git' 'lbry-app-bin' 'dragon-drag-and-drop' 'mailspring' 'rxvt-unicode-pixbuf' 'spotify' 'whatsapp-nativefier-dark')

  for packet in "${packets[@]}"; do
      echo "Instalando --> ${packet}"
      yay -S "${packet}" --save --answerclean All --answerdiff None
  done

  echo -e "\n###############################"
  echo "¡El software ha sido instalado!"
  echo "###############################"
  pause 'Presiona [ENTER] para continuar...'

}

##Software PIP
function f_software_pip () {
  clear
  echo "#############################"
  echo "[=] PIP Software             "
  echo "#############################"

  packets=('pywal' 'psutil' 'fontawesome' 'xdg' 'iwlib')

  for packet in "${packets[@]}"; do
      echo "Instalando --> ${packet}"
      sudo pip install "${packet}"
  done

  echo -e "\n###############################"
  echo "¡El software ha sido instalado!"
  echo "###############################"
  pause 'Presiona [ENTER] para continuar...'

}

##Virtualbox
function f_virtualbox () {
  clear
  echo "#############################"
  echo "[=] Virtualbox    "
  echo "#############################"

  packets=('pywal' 'psutil' 'fontawesome' 'xdg' 'iwlib')

  for packet in "${packets[@]}"; do
      echo "Instalando --> ${packet}"
      sudo pip install "${packet}"
  done

  sudo groupadd win10disk
  sudo usermod -a -G win10disk $USER
  comando para agregar archivo con texto falta.
  VBoxManage internalcommands createrawvmdk -filename /path/to/diskname.vmdk -rawdisk /dev/sdX

  echo -e "\n###############################"
  echo "¡El software ha sido instalado!"
  echo "###############################"
  pause 'Presiona [ENTER] para continuar...'

}

## #!/usr/bin/env zsh

function f_zsh () {
  sh -c "$(wget https://raw.github.com/robbyrussell/oh-my-zsh/master/tools/install.sh -O -)"
  git clone https://github.com/zsh-users/zsh-syntax-highlighting.git ${ZSH_CUSTOM:-~/.oh-my-zsh/custom}/plugins/zsh-syntax-highlighting
  git clone https://github.com/zsh-users/zsh-autosuggestions ${ZSH_CUSTOM:-~/.oh-my-zsh/custom}/plugins/zsh-autosuggestions

}

##Copy configuration files Desktop
function f_fonts_files_desktop () {
  clear
  echo "#############################"
  echo "[=] Fuentes y archivos       "
  echo "#############################"

  packets=('otf-fira-code')

  for packet in "${packets[@]}"; do
      echo "Instalando fuente --> ${packet}"
      sudo pacman -S --noconfirm --needed "${packet}"
  done
  echo -e "\n###############################"
  echo "¡El software ha sido instalado!"
  echo "###############################"
  echo "¡Copiando archivos.!"
  echo "###############################"

  ## Creando directorios
  mkdir ~/.config/qtile
  mkdir ~/.config/ranger
  mkdir ~/.config/rofi
  mkdir ~/Pictures/screenshots

  ## Creando enlaces simbólicos
  cd
  rm -rf .Xdefaults
  ln -s ~/git/.Xdefaults .Xdefaults
  rm -rf .zshrc
  ln -s ~/git/.zshrc .zshrc
  ln -s ~/git/.config/qtile/wal.py wal

  cd ~/.config/qtile
  rm -rf config.py
  ln -s ~/git/.config/qtile/config_desktop.py config.py
  rm -rf autostart
  ln -s ~/git/.config/qtile/autostart_desktop.sh autostart
  chmod +x autostart

  cd ~/.config/ranger
  rm -rf rc.conf
  ln -s ~/git/.config/ranger/rc.conf rc.conf

  cd ~/.config/rofi
  rm -rf config
  ln -s ~/git/.config/rofi/config config
  rm -rf config.rasi
  ln -s ~/git/.config/rofi/config.rasi config.rasi
  rm -rf config.wpgtk
  ln -s ~/git/.config/rofi/config.wpgtk config.wpgtk

  cd ~/git/
  cp -a .themes ~/.themes
  cp -a .icons ~/.icons

  chmod +x /home/gibranlp/MEGA/computerStuff/keyboard/keyboard_activate.sh
  chmod +x /home/gibranlp/MEGA/computerStuff/keyboard/keyboard_deactivate.sh

  pause 'Presiona [ENTER] para continuar...'

}

##Copy configuration files Lapotop
function f_fonts_files_laptop () {
  clear
  echo "#############################"
  echo "[=] LightDM        "
  echo "#############################"

  packets=('otf-fira-code')

  for packet in "${packets[@]}"; do
      echo "Instalando fuente --> ${packet}"
      sudo pacman -S --noconfirm --needed "${packet}"
  done
  echo -e "\n###############################"
  echo "¡El software ha sido instalado!"
  echo "###############################"
  echo "¡Copiando archivos.!"
  echo "###############################"

  ## Creando directorios
  mkdir ~/.config/qtile
  mkdir ~/.config/ranger
  mkdir ~/.config/rofi

  ## Creando enlaces simbólicos
  cd
  rm -rf .Xdefaults
  ln -s ~/git/.Xdefaults .Xdefaults
  rm -rf .zshrc
  ln -s ~/git/.zshrc .zshrc
  ln -s ~/git/.config/qtile/set_wal.py wal

  cd ~/.config/qtile
  rm -rf config.py
  ln -s ~/git/.config/qtile/config_laptop.py config.py
  rm -rf autostart
  ln -s ~/git/.config/qtile/autostart_laptop.sh autostart
  chmod +x autostart

  cd ~/.config/ranger
  rm -rf rc.conf
  ln -s ~/git/.config/ranger/rc.conf rc.conf

  cd ~/.config/rofi
  rm -rf config
  ln -s ~/git/.config/rofi/config config
  rm -rf config.rasi
  ln -s ~/git/.config/rofi/config.rasi config.rasi
  rm -rf config.wpgtk
  ln -s ~/git/.config/rofi/config.wpgtk config.wpgtk

  cd ~/git/
  cp -a .themes ~/.themes
  cp -a .icons ~/.icons

  sudo cp /home/gibranlp/git/etc/X11/xorg.conf.d/90-touchpad.conf /etc/X11/xorg.conf.d/90-touchpad.conf
  pause 'Presiona [ENTER] para continuar...'

}

##LightDM
function f_lightdm () {
  sudo cp ~/git/etc/lightdm/lightdm.conf /etc/lightdm/lightdm.conf
  sudo cp ~/git/etc/lightdm/lightdm-webkit2-greeter.conf /etc/lightdm/lightdm-webkit2-greeter.conf
  sudo cp ~/MEGA/wallPapers/* /usr/share/backgrounds
  sudo chmod -R 644 /usr/share/backgrounds
  sudo chmod 755 /usr/share/backgrounds


}

#-------------------------------------------------------------------------



## Programa
echo "[+] Hola $USER, Bienvenido al Post-Instalador para Anarchy Linux"
echo -e "\n[=] Creado por <gibranlp/> o__O"
echo -e "\n########################"
echo "[=]  Menú Principal     "
echo "########################"
PS3='Selecciona una opción: '
options=("[=]Actualizar" "[=]Actualizar AUR" "[=]Nvidia Drivers" "[=]Audio" "[=]Software" "[=]Software_aur" "[=]Software_pip" "[=]Zsh" "[=]Desktop Archivos y Fuentes" "[=]Laptop Archivos y Fuentes" "[=]LightDM" "[=]Salir" )
select opt in "${options[@]}"
do
  case $opt in
    "[=]Actualizar")
      f_update
      ;;
    "[=]Actualizar AUR")
      f_aur
      ;;
    "[=]Nvidia Drivers")
      f_nvidia
      ;;
    "[=]Audio")
      f_audio
      ;;
    "[=]Software")
      f_software
      ;;
    "[=]Software_aur")
      f_software_aur
      ;;
    "[=]Software_pip")
      f_software_pip
      ;;
    "[=]Ranger")
      f_software_pip
      ;;
    "[=]Zsh")
      f_zsh
      ;;
    "[=]Desktop Archivos y Fuentes")
      f_fonts_files_desktop
      ;;
    "[=]Laptop Archivos y Fuentes")
      f_fonts_files_laptop
      ;;
    "[=]LightDM")
      f_lightdm
      ;;
    "[=]Salir")
      break
      ;;
    *) echo "Opción inválida $REPLY";;
  esac
done



# Realización por Gibranlp.

# Hoy en la noche mientras me bañaba, estaba tratando de provocarme placer, por decirlo así, y mi cabeza viajaba de una imagen a otra, la sitación era peculiar, pues
