#!/bin/sh

cd
rm -rf .dotfiles_bak/
mv .dotfiles .dotfiles_bak
mkdir .dotfiles

git clone https://github.com/ajeeth/nixos-config /home/ajeeth/.dotfiles

cd .dotfiles

cp /etc/nixos/hardware-configuration.nix system/hardware-configuration.nix
rm flake.lock

sudo nixos-rebuild switch --flake .#system

echo ""
echo "## <if successful run these commands> ##"
echo "cd $HOME/.dotfiles"
echo "sudo chown ajeeth:users ../.cache/nix/eval-cache-v5/*"
echo "sudo chown ajeeth:users flake.lock"
echo ""
echo 'home-manager switch --flake .#user'
