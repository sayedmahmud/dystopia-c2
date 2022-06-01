#!/usr/bin/env bash

if [[ "$OSTYPE" == "linux-gnu"* ]]; then
	export DISTRIB=$(awk -F= '/^DISTRIB_ID/{print $2}' /etc/lsb-release | tr -d \")
	if [[ ${DISTRIB} = "Arch"* ]]; then
		sudo pacman -Syyu
		yay -S python39
		sudo pacman -S python-pip --noconfirm 
		sudo pip3 install -r requirements.txt
		sudo pacman -S install wine --noconfirm
	elif [[ ${DISTRIB} = "ManjaroLinux"* ]]; then
		sudo pacman -Syyu
		yay -S python39
		sudo pacman -S python-pip --noconfirm 
		sudo pip3 install -r requirements.txt
		sudo pacman -S install wine --noconfirm
	fi
	else
		rm /var/lib/dpkg/lock
		rm /var/cache/apt/archives/lock
		rm /var/lib/apt/lists/lock
		sudo dpkg --add-architecture i386
		sudo apt-get update
		sudo apt-get install python3.9 -y
		sudo apt-get install python3-pip -y
		sudo pip3 install -r requirements.txt
		sudo apt-get install -y wine
	fi  
FILE=python-3.8.9.exe
if test -f "$FILE"; then
	echo "$FILE already exists."
else
	sudo wget https://www.python.org/ftp/python/3.8.9/python-3.8.9.exe
fi
arg1=$1
arg2="-s"
if [ "$arg1" == "$arg2" ]; then
	echo "Beginning silent Python 3.8.9 Installation"
	sudo wine cmd /c python-3.8.9.exe /quiet InstallAllUsers=0
else
	sudo wine cmd /c python-3.8.9.exe
fi
if [[ ${DISTRIB} = "Arch"* ]]; then
	sudo wine "/root/.wine/drive_c/users/root/AppData/Local/Programs/Python/Python38-32/python.exe" -m pip install keyboard==0.13.5 pywin32==303 pycryptodome==3.12.0 pyautogui==0.9.53 pyinstaller discord_webhook==0.14.0 discord.py opencv-python
elif [[ ${DISTRIB} = "ManjaroLinux"* ]]; then
	sudo wine "/root/.wine/drive_c/users/root/AppData/Local/Programs/Python/Python38-32/python.exe" -m pip install keyboard==0.13.5 pywin32==303 pycryptodome==3.12.0 pyautogui==0.9.53 pyinstaller discord_webhook==0.14.0 discord.py opencv-python
fi
else
	sudo wine "/root/.wine/drive_c/users/root/Local Settings/Application Data/Programs/Python/Python38-32/python.exe" -m pip install keyboard==0.13.5 pywin32==303 pycryptodome==3.12.0 pyautogui==0.9.53 pyinstaller discord_webhook==0.14.0 discord.py opencv-python
fi
