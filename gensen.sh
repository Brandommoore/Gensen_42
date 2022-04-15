#!/bin/bash

#VARS
bearer=""
gnf_file="genFile.gnf"

#Colours
greenColour="\e[0;32m\033[1m"
endColour="\033[0m\e[0m"
redColour="\e[0;31m\033[1m"
blueColour="\e[0;34m\033[1m"
yellowColour="\e[0;33m\033[1m"
purpleColour="\e[0;35m\033[1m"
turquoiseColour="\e[0;36m\033[1m"
grayColour="\e[0;37m\033[1m"


# Functions
function header()
{
	echo -e "${greenColour}.________________________.______________.${endColour}"
	echo -e "${greenColour}|                        |  *     ****  |${endColour}"
	echo -e "${greenColour}| Welcome to GENSEN v0.1 |  *  *     *  |${endColour}"
	echo -e "${greenColour}|                        |  ****  ****  |${endColour}"
	echo -e "${greenColour}|     coded_by: BRMO     |     *  *     |${endColour}"
	echo -e "${greenColour}|                        |     *  ****  |${endColour}"
	echo -e "${greenColour}*------------------------*--------------*${endColour}"
	echo
}

function check_gnf_file()
{
	if [ -f "genFile.gnf" ]; then
		echo "1" # File exist
	else
		echo "0" # File no exist
	fi
}

# Manin function
header

if [ $(check_gnf_file) -eq 1 ]; then
	bearer=$(tail -n1 $gnf_file)
	if [ $bearer = "invalid_client" ]; then
		bash gensen_linux.sh
	else
		echo -e "${yellowColour}Your BEARER token: ${endColour}${purpleColour} $bearer ${endColour}\n"
	fi
else
	bash gensen_linux.sh
fi

#check_gnf_file
