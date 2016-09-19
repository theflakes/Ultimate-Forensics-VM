#!/bin/sh
if [ $# -ne 2 ]
then
        echo "Usage: $0 /path/to/yara/rules file_to_scan"
else
        for file in $(find $1 -maxdepth 1 -type f -name "*.yar"); do
                if zenity --question --text="Use $file?" --ok-label=Yes --cancel-label=No
                then
                        yara -w $file $2
                fi
        done
fi
