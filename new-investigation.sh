#!/bin/sh
#
# Author: Brian Kellogg
#
# Purpose: Automate forensic static analysis of file(s)
#
#
if [ $# -ne 2 ]; then
    echo "\nUsage: $0 investigation_name (file|directory) yara_rules_dir\n"
    exit 0
fi


function hash {

}


function pcap {

}


CUR_DIR=`pwd`
DIRECTORY="$HOME/investigations"
INVEST_WORK_DIR=$DIRECTORY/$1
# were we passed a directory or file to examine
if [ -d "$2" ]; then
    EXAMINE_DIR=$2
elif [ -f "$2" ]; then
    EXAMINE_FILE=$2
else
    echo "$2 is not a directory or a file."
    exit 1
fi
# was the yara rules location specified
if [ ! -z "$3" ]; then
    YARA_RULES=$3
else
    YARA_RULES="$HOME/yara/rules"
fi

if [ ! -d "$DIRECTORY" ]; then
    mkdir "$DIRECTORY"
fi

if [ ! -d "$INVEST_WORK_DIR" ]; then
    echo"\nCreating directory tree in $INVEST_WORK_DIR\n"
    mkdir "$INVEST_WORK_DIR"
    mkdir "$INVEST_WORK_DIR/suricata"
    echo "\nCopying and updating suricata.yaml conf file in $INVEST_WORK_DIR/suricata/...\n"
    find /etc/nsm/ -name 'suricata.yaml' -exec cp {} $INVEST_WORK_DIR/suricata/  \;
    sed -i '/- fast:/{n;s/no/yes/;}' $INVEST_WORK_DIR/suricata/suricata.yaml
    sed -i '/- unified2-alert:/{n;s/yes/no/;}' $INVEST_WORK_DIR/suricata/suricata.yaml
    mkdir "$INVEST_WORK_DIR/bro"
    mkdir "$INVEST_WORK_DIR/bro/extracted"
    mkdir "$INVEST_WORK_DIR/tcpflow"
    echo "\nUpdating ClamAV DB...\n"
    #sudo freshclam
    echo "\nFetching yara rules...\n"
    if [ -d "$YARA_RULES" ]; then
        cd "$YARA_RULES"
        #git remote update
    else
        mkdir "$HOME/yara"
        cd "$HOME/yara/rules"
        git clone https://github.com/Yara-Rules/rules.git
    fi
    
else
    echo "\n$INVEST_WORK_DIR exists!"
    echo "Please clean/archive this directory.\n"
    exit 0
fi

cd $CUR_DIR
if [ ! -z "$EXAMINE_DIR" ]; then
    for file in $EXAMINE_DIR/*; do
        a=`file "$file" | cut -f2 -d' '`
        echo $a
    done
else 
    a=`file "$EXAMINE_FILE" | cut -f2 -d' '`
    echo $a
fi
