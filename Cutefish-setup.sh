#!/bin/bash
# LMAE Bash Installer | Cutefish Editon Setup
if (whiptail --title "Linux Mint Arch Edition | Cutefish Setup" --yesno "Are you sure you want to continue installing?" 8 40 --yes-button "Yes" --no-button "No"); then
	yay -Syyu cutefish vlc cutefish-calculator cutefish-core cutefish-cursor-themes-git cutefish-gtk-themes-git cutefish-kwin-plugins cutefish-screenshot-git cutefish-videoplayer-git sddm | \
    	tr '[:upper:]' '[:lower:]' | whiptail --title "Linux Mint Arch Edition | Installing Packages" \
        --gauge "The installer is now doing required steps to provide you a great desktop..." 7 70 0
	systemctl enable sddm
else
	echo "User aborted the install."
fi
