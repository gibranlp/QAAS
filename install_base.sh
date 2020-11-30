#!/usr/bin/env bash

function i_base () {
  packets=(
    'base-devel'
    'htop'
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
    'evince'
    'playerctl'
    'firefox'
    'filezilla'
    'rxvt-unicode'
    'urxvt-perls'
    'cups'
    'cups-pdf'
    'speedtest-cli'
    'wireshark-cli'
    'gutenprint'
    'gtk3-print-backends'
    'nmap'
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
    'surfraw'
    'python-pip'
    'pkgfile'
    'ranger'
    'zsh'
    'feh'
    'xorg-server-xephyr'
    'neofetch'
    'lxappearance'
    'lxsession'
    'transmission-gtk'
    'numlockx'
    'unzip'
    'hugo'
    'slim'
    'khal'
    'vdirsyncer'
    'bmon'
    'lm_sensors'
    'vis'
    'obconf'
)

for packet in "${packets[@]}"; do
    echo "Instalando --> ${packet}"
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
    'ipc'
    'pywalfox'
    'python-dateutil'
  )

  for pip_packet in "${pip_packets[@]}"; do
    echo "Instalando --> ${pip_packet}"
    sudo pip install "${pip_packet}"
  done
}

# yay -S anydesk-bin betterlockscreen python-haishoku python-colorthief visual-studio-code-bin dnsutils


i_base
i_yay
i_pip
