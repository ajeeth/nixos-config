#!/bin/sh

sudo nix-collect-garbage
nix-collect-garbage

echo ""
echo "## Use these to delete older than specified days ##"
echo "sudo nix-collect-garbage --delete-older-than 10d"
echo "nix-collect-garbage --delete-older-than 10d"

# Below will delete all old generations. Use with care
#sudo nix-collect-garbage --delete-old
#nix-collect-garbage --delete-old
