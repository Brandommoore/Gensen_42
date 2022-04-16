#!/bin/bash
# Regenerate bearer token when 

#VARS
outfile="genFile.gnf"
uid=$(tail -n3 genFile.gnf | head -n1)
secret=$(tail -n2 genFile.gnf | head -n1)
date=$(date)

function genBearer()
{
	touch bearer.bfl
	bearer_str=$(curl -s -X POST --data "grant_type=client_credentials&client_id=$uid&client_secret=$secret" https://api.intra.42.fr/oauth/token > bearer.bfl)
	bearer=$(cut -d ":" -f2 bearer.bfl | cut -d "," -f1 | cut -d '"' -f2)
	rm bearer.bfl
	echo $bearer
}

function main()
{
	echo $date >> $outfile
	echo $uid >> $outfile
	echo $secret >> $outfile
	echo $(genBearer) >> $outfile
}

main