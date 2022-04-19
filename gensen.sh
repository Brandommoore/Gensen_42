#!/bin/bash

#VARS
bearer=""
gnf_file="genFile.gnf"

#COLORS
ENDCOLOR="\033[0m"
GREENCOLOR="\033[1;32m"
REDCOLOR="\033[0;31m"
BLUECOLOR="\033[0;34m"
YELLOWCOLOR="\033[1;33m"
PURPLECOLOR="\033[0;35m"
TURQUOISECOLOR="\033[0;36m"
GRAYCOLOR="\033[0;37m"

# Functions
function header()
{
	echo "${GREENCOLOR}.________________________.______________.${ENDCOLOR}"
	echo "${GREENCOLOR}|                        |  *     ****  |${ENDCOLOR}"
	echo "${GREENCOLOR}| Welcome to GENSEN v0.1 |  *  *     *  |${ENDCOLOR}"
	echo "${GREENCOLOR}|                        |  ****  ****  |${ENDCOLOR}"
	echo "${GREENCOLOR}|     coded_by: BRMO     |     *  *     |${ENDCOLOR}"
	echo "${GREENCOLOR}|                        |     *  ****  |${ENDCOLOR}"
	echo "${GREENCOLOR}*------------------------*--------------*${ENDCOLOR}"
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
		echo "${YELLOWCOLOR}Your BEARER token: ${ENDCOLOR}${PURPLECOLOR} $bearer ${ENDCOLOR}\n"
	fi
else
	bash gensen_linux.sh
fi

#check_gnf_file
