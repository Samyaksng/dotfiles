#!/bin/bash

# Clear package cache
echo "Clearing package cache..."
sudo pacman -Scc --noconfirm

# Remove orphaned packages
echo "Removing orphaned packages..."
sudo pacman -Rns $(pacman -Qdtq) --noconfirm

# Clear system cache
echo "Clearing system cache..."
sudo systemd-tmpfiles --clean

# Clear user cache
echo "Clearing user cache..."
rm -rf ~/.cache/*

# Clear AUR cache (if using yay)
if command -v yay &> /dev/null; then
    echo "Clearing AUR cache..."
    yay -Rns $(yay -Qdtq) --noconfirm
else
    echo "yay not found, skipping AUR cache clearance."
fi

echo "Cache clearance completed."
