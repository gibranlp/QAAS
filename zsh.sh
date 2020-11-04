#!/usr/bin/env bash
function zsh(){
  #sh -c "$(wget https://raw.github.com/robbyrussell/oh-my-zsh/master/tools/install.sh -O -)"
  #git clone https://github.com/zsh-users/zsh-syntax-highlighting.git ${ZSH_CUSTOM:-/home/$USER/.oh-my-zsh/custom}/plugins/zsh-syntax-highlighting
  #git clone https://github.com/zsh-users/zsh-autosuggestions ${ZSH_CUSTOM:-/home/$USER/.oh-my-zsh/custom}/plugins/zsh-autosuggestions
  cp ~/QAAS/dotfiles/.oh-my-zsh/themes/passion.zsh-theme ~/.oh-my-zsh/themes/passion.zsh-theme
  #cp ~/QAAS/dotfiles/.zshrc ~/.zshrc
}

zsh
