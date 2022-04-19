#!/bin/bash
#Gensen. API generator saver
#Coded: BRMO
#Version: v0.1

#COLORS
ENDCOLOR="\033[0m"
GREENCOLOR="\033[1;32m"
REDCOLOR="\033[0;31m"
BLUECOLOR="\033[0;34m"
YELLOWCOLOR="\033[1;33m"
PURPLECOLOR="\033[0;35m"
TURQUOISECOLOR="\033[0;36m"
GRAYCOLOR="\033[0;37m"

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
echo -ne "${YELLOWCOLOR}Insert your UID key:${TURQUOISECOLOR}"
read -p " " uid
echo -ne "${YELLOWCOLOR}Insert your SECRET key:${TURQUOISECOLOR}"
read -p " " secret
echo -e "${ENDCOLOR}"
genFile
echo $uid >> $f_name
echo $secret >> $f_name
bearer=$(genBearer)
echo $bearer >> $f_name
echo
echo -e "${YELLOWCOLOR}Your BEARER token: ${ENDCOLOR}${PURPLECOLOR} $bearer ${ENDCOLOR}\n"
