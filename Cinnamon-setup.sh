#!/bin/bash
# LMAE Bash Installer | Cinnamon Editon Setup
if (whiptail --title "Linux Mint Arch Edition | Cinnamon Setup" --yesno "Are you sure you want to continue installing?" 8 40 --yes-button "Yes" --no-button "No"); then
	yay -S --noconfirm cinnamon mint-artwork-cinnamon mint-artwork mint-backgrounds mint-themes mint-themes-legacy mint-x-icons mint-y-icons pix gnome-software networkmanager nemo nemo-fileroller firefox libreoffice-fresh thunderbird gprename gucharmap gnome-disk-utility gparted eog neofetch timeshift ufw gufw vlc remmina os-prober systemd-swap zramswap lm_sensors lib32-lm_sensors ttf-ubuntu-font-family noto-fonts-cjk noto-fonts-emoji | \
    	tr '[:upper:]' '[:lower:]' | whiptail --title "Linux Mint Arch Edition | Installing Packages" \
        --gauge "The installer is now doing required steps to provide you a great desktop..." 7 70 0
else
	echo "User chose to abort installation."
fi
