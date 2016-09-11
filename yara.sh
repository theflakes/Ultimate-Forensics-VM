#!/bin/sh
for file in $(find $1 -maxdepth 1 -type f -name "*.yar"); do 
	if zenity --question --text="Use $file?" --ok-label=Yes --cancel-label=No
	then
    		yara -w $file $2
	fi
done
