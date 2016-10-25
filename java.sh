#!/bin/bash


#Only user with uid=0 have root privileges
ROOT_UID=0

#folder where java will be installed
DEST="/opt/"
#name of folder where java will be installed
FOLDER="java"
#link for java source
BASE_URL="http://download.oracle.com/otn-pub/java/jdk/8u102-b14/jdk-8u102-linux-x64.tar.gz"
#Source file name
SRC=`echo ${BASE_URL} | rev | cut -d "/" -f 1 | rev`


#Make sure script runs by root user
if [ "$UID" -ne "$ROOT_UID" ]
then
    echo "This script must be run as root"2>&1
    exit $E_NOTROOT
fi

echo
echo "**********************************
INSTALLING JAVA (version = `sed -i 's/u/./g' < echo ${BASE_URL} | rev | cut -d '/' -f 1 | rev | cut -d '-' -f 2`)
**********************************"
echo
exit 1;

#Move to installation folder
cd ${DEST}
mkdir -p ${FOLDER}
cd ${FOLDER}

#Download java source
echo
echo "DOWNLOAD JAVA SOURCE FROM"
wget -c --no-check-certificate --no-cookies --header "Cookie: oraclelicense=accept-securebackup-cookie" "${BASE_URL}"

#Extracting java from archive
#gunzip ${SRC}
#Get extracted folder name
echo ${SRC}
DIR_NAME=`tar -tzf ${SRC} | head -1 | cut -f 1 -d "/"`

#extract archive
echo
echo "EXTRACTING JAVA FROM ARCHIVE"
tar -xvzf ${SRC}
#Delete archive
echo "DELETING JAVA ARCHIVE"

echo "JAVA WAS SECCESSFUlY INSTALLED IN ${DEST}${FOLDER}"

exit 0;
