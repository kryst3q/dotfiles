#!/bin/bash

# TODO: check if zsh is set as SHELL

if [ $(uname) = "Linux" ]; then
    # # Make enabling default keyring possible at login
    # # TODO: check if gnome-keyring was installed
    # echo "auth       optional     pam_gnome_keyring.so" >> /etc/pam.d/login
    # echo "session    optional     pam_gnome_keyring.so auto_start" >> /etc/pam.d/login

    # TODO: check if xorg and xorg-xinit are installed
    cp ./.xinitrc ${HOME}/
fi

cp ./zsh/.config/zsh/.zshenv ${HOME}/

# Install Vim-Plug
sh -c 'curl -fLo "${XDG_DATA_HOME:-$HOME/.local/share}"/nvim/site/autoload/plug.vim --create-dirs \
       https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim'

# TODO: check if GNU Stow is installed

for i in * ; do
  if [ -d "$i" ]; then
    stow ${i} 
  fi
done

if [ $(uname) = "Linux" ]; then
    for i in ${XDG_CONFIG_HOME}/systemd/user/*.service ; do
      if [ -f "$i" ]; then
        systemctl --user enable ${i}
      fi
    done
fi
