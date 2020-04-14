#!/usr/bin/env bash
#---------------------------------------------------------------------##########

#                        mmmm
#   mmm                 m"  "m
#  #" "#                #    #
#  #   #                #    #
#  "#m#"                 #mm#
#
#        """""""""""""
#
#---------------------------------------------------------------------##########

## Creado por GIBRANLP 2020
## Cualquier cosa --> info@gibranlp.dev
## Qtile AutoInstall & AutoRicing Script (QAAS for Arch)
## No sólo ejecutes este script, analiza o_O Investiga!
## ¡Aprende y Diviertete!

#---------------------------------------------------------------------##########

##--------------------------- Variables ------------------------------##########


# Funciones

##Pausa

function pause(){
   read -p "$*"
}

##----------------------Error --------------------------------------_-##########

function error() {
clear;
printf "Error:\\n%s\\n" "$1"; exit;
}

##----------------Instalar el software necesario ---------------------##########

function f_base () {
  packets=(
    'base-devel' #utilidades para compilar paquetes
    'git'
    'mesa'
    'alsa-utils'
    'alsa-lib'
    'alsa-firmware'
    'gstreamer'
    'gst-plugins-bad'
    'gst-plugins-base'
    'gst-plugins-ugly'
    'alsa-plugins'
    'otf-fira-code'
    'pulseaudio'
    'pulseaudio-alsa'
    'pavucontrol'
    'volumeicon'
    'picom'
    'qtile'
    'lshw'
    'ttf-font-awesome'
    'scrot'
    'rofi'
    'python-pip'
    'pkgfile'
    'ranger'
    'zsh'
    'reflector'
    'feh'
    'xorg-server-xephyr'
    'neofetch'
    'lxappearance'
    'lxsession'
    'numlockx'
    'lightdm-webkit2-greeter'
    'lightdm-webkit-theme-litarvan'
    'lightdm-gtk-greeter'
)

for packet in "${packets[@]}"; do
    echo "Instalando --> ${packet}" #Loop para instalar todos los paquetes
    sudo pacman -S "${packet}" --noconfirm --needed
done

sudo reflector --verbose --latest 5 --sort rate --save /etc/pacman.d/mirrorlist

sudo pacman -Syyu --noconfirm --needed

sudo sed -i "s/-j2/-j$(nproc)/;s/^#MAKEFLAGS/MAKEFLAGS/" /etc/makepkg.conf
## ------------------Programas de Python -----------------------------##########

pip_packets=(
  'pywal'
  'psutil'
  'fontawesome'
  'xdg'
  'iwlib'
)

for pip_packet in "${pip_packets[@]}"; do
  echo "Instalando --> ${pip_packet}"
  sudo pip install "${pip_packet}"
done

## ------------------Instalar Yay ------------------------------------##########

git clone https://aur.archlinux.org/yay.git && cd yay
makepkg -si && cd
rm -rf yay
yay

aur_packets=('rxvt-unicode-pixbuf' 'tusk' 'ocs-url' 'minder-git' 'typora' 'onlyoffice-bin' 'fontpreview-git' 'dragon-drag-and-drop' 'mailspring' 'rxvt-unicode-pixbuf' 'spotify' 'whatsapp-nativefier-dark')

for aur_packet in "${aur_packets[@]}"; do
      echo "Instalando --> ${aur_packet}"
      yay -S "${aur_packet}" --save --answerclean All --answerdiff None
done
## -------------------Instalar ZSH -----------------------------------##########

sh -c "$(wget https://raw.github.com/robbyrussell/oh-my-zsh/master/tools/install.sh -O -)"
git clone https://github.com/zsh-users/zsh-syntax-highlighting.git ${ZSH_CUSTOM:-~/.oh-my-zsh/custom}/plugins/zsh-syntax-highlighting
git clone https://github.com/zsh-users/zsh-autosuggestions ${ZSH_CUSTOM:-~/.oh-my-zsh/custom}/plugins/zsh-autosuggestions

## --------------- Configuraciones y archivos ------------------------##########

sudo systemctl enable lightdm.service # Habiltar lightdm

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

cd ~/.config/qtile
rm -rf config.py
ln -s ~/git/.config/qtile/config_desktop.py config.py
rm -rf autostart
ln -s ~/git/.config/qtile/autostart_laptop.sh autostart.sh
chmod +x autostart.sh

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

#chmod +x ~/git/keyboard/keyboard_activate.sh
#chmod +x ~/git/keyboard/keyboard_deactivate.sh


}

## --------------- Mensaje de Bienvenida -----------------------------##########
#function welcomemsg() {
#  	dialog --title "¡Bienvendo!" --msgbox "Bienvenido a (QA&AS) Qtile Autoinstall & AutoRicing Script\\n\\nEste scritp instalará un ambiente gráfico completo, el cual utilizo en mi PC\\n\\nEste Script instalará todo de forma automática\\n\\n-gibranlp" 12 70
#}

## ---------------------El Programa como tal--------------------------##########

#welcomemsg || error "Abortado por el usuario"
echo "[+] Hola $USER, Bienvenido al Post-Instalador para Anarchy Linux"
echo -e "\n[=] Creado por <gibranlp/> o__O"
echo -e "\n########################"
echo "[=]  Menú Principal     "
echo "########################"
PS3='Selecciona una opción: '
options=("[=]Base" "[=]Salir" )
select opt in "${options[@]}"
do
  case $opt in
    "[=]Base")
      f_base
      ;;
    "[=]Salir")
      break
      ;;
    *)
    echo "Opción inválida $REPLY"
    ;;
  esac
done
