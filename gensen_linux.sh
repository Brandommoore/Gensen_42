#!/bin/bash
#Gensen. API generator saver
#Coded: BRMO
#Version: v0.1

#Colours
greenColour="\e[0;32m\033[1m"
endColour="\033[0m\e[0m"
redColour="\e[0;31m\033[1m"
blueColour="\e[0;34m\033[1m"
yellowColour="\e[0;33m\033[1m"
purpleColour="\e[0;35m\033[1m"
turquoiseColour="\e[0;36m\033[1m"
grayColour="\e[0;37m\033[1m"

#VARS
uid=""
secret=""
bearer_key=""
f_name="genFile.gnf"

#Functions
function genFile()
{
	touch $f_name
	date >> $f_name
}

function genBearer()
{
	touch bearer.bfl
	bearer_str=$(curl -s -X POST --data "grant_type=client_credentials&client_id=$uid&client_secret=$secret" https://api.intra.42.fr/oauth/token > bearer.bfl)
	bearer=$(cut -d ":" -f2 bearer.bfl | cut -d "," -f1 | cut -d '"' -f2)
	rm bearer.bfl
	echo $bearer
}

#Main function
echo -ne "${yellowColour}Insert your UID key:${turquoiseColour}"
read -p " " uid
echo -ne "${yellowColour}Insert your SECRET key:${turquoiseColour}"
read -p " " secret
echo -e "${endColour}"
genFile
echo $uid >> $f_name
echo $secret >> $f_name
bearer=$(genBearer)
echo $bearer >> $f_name
echo
echo -e "${yellowColour}Your BEARER token: ${endColour}${purpleColour} $bearer ${endColour}\n"
