function f_base () {
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
    echo "Instalando --> ${packet}"
    sudo pacman -S "${packet}" --noconfirm --needed
done
}

f_base
