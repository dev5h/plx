#!/data/data/com.termux/files/usr/bin/bash

RED='\033[0;31m'
NC='\033[0m'
GREEN='\033[0;32m'
YELL='\033[1;33m'


clear &&

echo -e "${RED}██████  ██      ██   ██ 
██   ██ ██       ██ ██  
██████  ██        ███   
██      ██       ██ ██  
██      ███████ ██   ██ 
                        
                        ${NC}"

fLine(){

	echo -e "[${YELL}**${NC}]  ${GREEN} $1 ${NC}"
}


installDistro(){
	
	if [[ $1 == 'ubuntu' ]]
	then
		proot-distro install ubuntu-20.04
	
	elif [[ $1 == 'arch' ]]
	then
		proot-distro install archlinux

	elif [[ $1 == 'alpine' ]]
	then
                proot-distro install alpine
	elif [[ $1 == 'debian' ]]
	then
                proot-distro install archlinux debian-buster
	elif [[ $1 == 'fedora' ]]
	then
                proot-distro install fedora-33
	elif [[ $1 == 'nethunter' ]]
	then
                proot-distro install nethunter

	elif [[ $1 == 'parrot' ]]
	then
                proot-distro install paroot-lts
	
	elif [[ $1 == 'kali' ]]
	then
		./installKali.sh
	
	else
		fLine "Sorry no distro called of code $1 available now ."
		fLine "See plx --help for further help"
		fLine "Run plx list for available disrro list"
	fi
}

validateInstall() {

	 PROOT=/data/data/com.termux/files/usr/bin/proot-distro 
	 fLine "Checking for dependencies"
	 if [[ -f "$PROOT"  ]]
	 then
		 fLine "Dependencies are already installed at $PROOT"
		 fLine "Running installer for $1"

		 installDistro $1
		 
		
	 else
		 fLine "Dependency not available"
		 fLine "Installing dependecies"
		 apt update && apt upgrade && apt install proot-distro
		 fLine "Running installer for $1"
		 installDistro $1

	fi
}
 

if [[ $1 == "install" ]]
then
	if [[ $2 == "" ]]
	then
		echo -e "${RED} Plese specify the distro code"
		echo -e "${NC} <#> To check available distro use plx list for more info use --help flag"

	else
		validateInstall $2
	fi

elif [[ $1 == "login" ]]
then
	echo "Loggin in..."

elif [[ $1 == "" ]]
then
	echo -e "${RED}Parameter cannot be null ${NC}"

elif [[ $1 == "list" ]]
then
	proot-distro list
elif [[ $1 == "--help" ]]
then
	echo  "plx stands for pocket linux . This allows you to install linux Distributions on termux . You can play with different linux distros with it.  It is based on proot. "
	echo "plx <action> values "
	echo "plx list - to show distro list"
	echo "plx install <distroname> to install a linux distro"
	echo "plx remove <distroname> to remove an installed distro"
	echo "plx login <distroname> to login to a distro "
	echo " After login simply type logout to back to regular termux"
	echo "plx --helo for this message"
else	
	echo "Invalid argument type --help for help"

fi
