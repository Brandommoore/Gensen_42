#!/bin/bash
# Expedition date script from file

#VARS
file_name="genfile.gnf"
file_date=""
current_time=""
time_to_exp="+2 hours"
exp_date=""

#Functions
function is_date_exp()
{
	# current_time, exp_date
	# if (current_time < exp_date){noexp(0)}else{exp(1)}
	echo $1
	echo $2
	echo "---------------------------"
	if [ $1 -lt $2 ]; then
		echo "0"
	elif [ $1 -ge $2 ]; then
		echo "1"
	fi
}

#Getting time
file_date=$(tail -n4 genFile.gnf | head -n1)
current_time=$(date +%s)

#Getting expedition date
exp_date=$(date --date="$file_date $time_to_exp" +%s)

# Exp_date function
is_date_exp $current_time $exp_date
