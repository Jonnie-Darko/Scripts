#!/bin/bash

#Ask about OSU GitLab Keys

echo "Have you established a good relationship with the OSU GitLab repository? (Y/n)"

read gitlab_answer

#Run if gitlab_answer is Y and terminate if n

if 	[ $gitlab_answer == "y" ] || [ $gitlab_answer == "Y" ]; then
	echo "Kickstarting your Linux Machine..."
elif [ $gitlab_answer == "n" ] || [ $gitlab_answer == "N" ]; then
	echo "You should go do that."
		exit 0
elif [ $gitlab_answer != "y" ] || [ $gitlab_answer != "Y" ] || [ $gitlab_answer != "n" ] || [ $gitlab_answer != "N" ]; then
	echo I\'m sorry, $USER. I\'m afraid I can\'t do that. 
	echo "Please run the script again." && echo "Make to answer Y for yes and n for no."
		exit 0
fi


#Assign All Programs to a Variable cyber_apps

cyber_apps=(
	'jack'
	'tree'
	'wireshark'
	'terminator'
	'lynis'
	'htop'
	'gnome-tweaks'
	'gnome-shell-extensions'
	'dconf-editor'
	'dsniff'
	'libreoffice'
	'build-essential libpcap-dev net-tools'
)

#Perform an Ubuntu Update Before Application Installations

sudo apt update -y

#For Loop to Install Applications in Variable cyber_apps

for apps in ${cyber_apps[@]}
do
	sudo apt install $apps -y
done

#Create a Cron

#Create a Clone of the OSU Git Files and Directories in /home

cd ~

cd OSU-Cyber/

git pull

#Do a Full System Upgrade

sudo apt upgrade -y

echo "OPERATION COMPLETED :D "
