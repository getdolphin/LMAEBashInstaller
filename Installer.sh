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
trap ctrl_c INT

function ctrl_c() {
        clear
	echo "Exiting..."
	exit
}

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
if [[ $(which whiptail) ]]; then
	echo "- whiptail is installed"
else
	echo -e "\e[31mError: the following package is missing: newt\e[0m"
	exit
fi
echo "Ensuring that required scripts are in the folder..."
if [[ $(find . | grep Cinnamon-setup.sh) ]]; then
	echo "- Cinnamon-setup.sh is available"
	if [[ $(find . | grep Cutefish-setup.sh) ]]; then
		echo "- Cutefish.setup.sh is available"
	else
		echo -e "\e[31mError: the following script is missing: Cutefish-setup.sh\e[0m"
		exit
	fi
else
	echo -e "\e[31mError: the following script is missing: Cinnamon-setup.sh\e[0m"
	exit
fi
echo -e "\e[34m             ...-:::::-..."
echo "          .-MMMMMMMMMMMMMMM-."
echo "      .-MMMM'..-:::::::-..'MMMM-."
echo "    .:MMMM.:MMMMMMMMMMMMMMM:.MMMM:."
echo "   -MMM-M---MMMMMMMMMMMMMMMMMMM.MMM-"
echo " ':MMM:MM'  :MMMM:....::-...-MMMM:MMM:'"
echo " :MMM:MMM'  :MM:'  ''    ''  ':MMM:MMM:"
echo ".MMM.MMMM'  :MM.  -MM.  .MM-  'MMMM.MMM."
echo ":MMM:MMMM'  :MM.  -MM-  .MM:  'MMMM-MMM:"
echo ":MMM:MMMM'  :MM.  -MM-  .MM:  'MMMM:MMM:"
echo ":MMM:MMMM'  :MM.  -MM-  .MM:  'MMMM-MMM:"
echo ".MMM.MMMM'  :MM:--:MM:--:MM:  'MMMM.MMM."
echo " :MMM:MMM-  '-MMMMMMMMMMMM-'  -MMM-MMM:"
echo "  :MMM:MMM:'                ':MMM:MMM:"
echo "   .MMM.MMMM:--------------:MMMM.MMM."
echo "     '-MMMM.-MMMMMMMMMMMMMMM-.MMMM-'"
echo "       '.-MMMM''--:::::--''MMMM-.'"
echo "            '-MMMMMMMMMMMMM-'"
echo -e "               ''-:::::-''\e[0m"
echo -e "Welcome to the \e[32mLinux Mint \e[34mArch Edition\e[0m Bash Installer!"
if (whiptail --title "Linux Mint Arch Edition | Desktop Environment" --yesno "Please choose your edition:\nCinnamon\nCutefish" 10 60 --yes-button "Cinnamon" --no-button "Cutefish"); then
	bash Cinnamon-setup.sh
else
	bash Cutefish-setup.sh
fi
