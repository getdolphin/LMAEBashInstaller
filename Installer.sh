#!/bin/bash
#              ...-:::::-...
#          .-MMMMMMMMMMMMMMM-.
#      .-MMMM`..-:::::::-..`MMMM-.
#    .:MMMM.:MMMMMMMMMMMMMMM:.MMMM:.
#   -MMM-M---MMMMMMMMMMMMMMMMMMM.MMM-
# `:MMM:MM`  :MMMM:....::-...-MMMM:MMM:`
# :MMM:MMM`  :MM:`  ``    ``  `:MMM:MMM:
#.MMM.MMMM`  :MM.  -MM.  .MM-  `MMMM.MMM.
#:MMM:MMMM`  :MM.  -MM-  .MM:  `MMMM-MMM:
#:MMM:MMMM`  :MM.  -MM-  .MM:  `MMMM:MMM:
#:MMM:MMMM`  :MM.  -MM-  .MM:  `MMMM-MMM:
#.MMM.MMMM`  :MM:--:MM:--:MM:  `MMMM.MMM.
# :MMM:MMM-  `-MMMMMMMMMMMM-`  -MMM-MMM:
#  :MMM:MMM:`                `:MMM:MMM:
#   .MMM.MMMM:--------------:MMMM.MMM.
#     '-MMMM.-MMMMMMMMMMMMMMM-.MMMM-'
#       '.-MMMM``--:::::--``MMMM-.'
#            '-MMMMMMMMMMMMM-'
#               ``-:::::-``
# Licensed under GNU GPLv3, Archimax (L) 2022
# Linux Mint Arch Edition Bash Installer
if [ "$EUID" -ne 0 ]
  then echo -e "\e[31mError: you are not root!\e[0m"
  exit
fi

if [[ $(which lsb_release) ]]; then
	echo "lsb_release is installed" > /dev/null
else
	echo -e "\e[31mPlease install lsb_release before running the installer.\e[0m"
fi
distroname=`lsb_release -d | cut -f 2-`
echo "Ensuring that Arch is the distribution (or another deriviative)..."

if [[ $(lsb_release -i | cut -f 2-) == "Arch" ]]; then
	echo "- Script is running on $distroname"
else
	echo -e "\e[31mError: the installer isn't running on Arch or an Arch based distro!\e[0m"
	exit
fi
echo "Checking for required binaries..."
if [[ $(which yay) ]]; then
	echo "- yay is installed"
else
	echo -e "\e[31mError: the following executable is missing: yay\e[0m"
	exit
fi
if [[ $(which git) ]]; then
	echo "- git is installed"
else
	echo -e "\e[31mError: the following executable is missing: git\e[0m"
	exit
fi

