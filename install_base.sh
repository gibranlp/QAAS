#!/usr/bin/env bash

function i_base () {
  packets=(
    'base-devel'
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
    'ttf-fira-code'
    'telegram-desktop'
    'cups'
    'cups-pdf'
    'pulseaudio'
    'pulseaudio-alsa'
    'pavucontrol'
    'volumeicon'
    'picom'
    'qtile'
    'lshw'
    'ttf-font-awesome'
    'gnome-keyring'
    'scrot'
    'rofi'
    'python-pip'
    'pkgfile'
    'ranger'
    'zsh'
    'feh'
    'xorg-server-xephyr'
    'neofetch'
    'lxappearance'
    'lxsession'
    'numlockx'
    'unzip'
)

for packet in "${packets[@]}"; do
    echo "Instalando --> ${packet}" #Loop para instalar todos los paquetes pacman
    sudo pacman -S "${packet}" --noconfirm --needed
done
}

function i_yay(){
  git clone https://aur.archlinux.org/yay.git && cd yay
  makepkg -si && cd
  rm -rf yay
  yay
}

function i_pip(){
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
}

i_base
i_yay
i_pip
