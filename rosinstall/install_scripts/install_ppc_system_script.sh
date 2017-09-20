#!/bin/bash

echo "WARNING: You are going to overwrite system settings! This operation cannot be undone!"
echo -n "ARE YOU SURE TO PROCEED? [y/N]"
read -N 1 REPLY

if [[ "$REPLY" = "y" || "$REPLY" = "Y" ]]; then
  cd /

  # remove default config files
  sudo rm etc/network/interfaces
  sudo rm etc/rc.local
  sudo rm etc/screenrc

  sudo git init
  sudo git remote add origin https://github.com/thor-mang/system_ppc_ubuntu.git
  sudo git fetch
  sudo git checkout -t origin/master

  echo "Installation completed! Please reboot system now."
else
  echo ">>> Install cancelled by user."
  exit 0
fi
