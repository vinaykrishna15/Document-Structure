#!/bin/bash

echo " "
echo "validating folders"
echo "--------"
#read -p "Enter path of the folder to validate:" fpath
#cd Document/\2017-11-06\
cd $1
#go to the folder with the highest date
highestDate=$(ls | sort -r -n | head -1)
cd $highestDate
echo "Checking folder: "  $highestDate
echo " "
declare -a folders=("Software Capacity" "Software Daisy" "Software Endamo" "Software NCG" "Software RWIN")

## now loop through the above array
for i in "${folders[@]}"
do
   if [ -d "$i" ]
   then
   echo "- $i exists"
else
echo "- $i is missing"
fi
   # or do whatever with individual element of the array
done


cd */

highestVersionNumber=$(ls | sort -r -n | head -1)
cd $highestVersionNumber

#cd $(ls -t | head -1)

#cd Software\ Capacity/
#cd $(ls -t | head -1)
#cd $2
echo "--------"
echo "validating files"
echo "-------"
echo "Checking folder: " $highestVersionNumber
echo " "
declare -a files=("Changelog.docx" "Manual.docx" "Runbooks.docx" "Environment description.docx")

## now loop through the above array
for i in "${files[@]}"
do
   if [ -f "$i" ]
   then
   echo "- $i exists"
else
echo "- $i is missing"
fi
   # or do whatever with individual element of the array
done
echo "-----------"
echo " "
echo " "

echo "Checking version number of Changelog.pdf"
v=$(pdfgrep Version Changelog.pdf)
echo "Changelog.pdf has the" $v

#pdfgrep Version Changelog.pdf | sed 's/Version /V/'
versionShort=$(sed 's/Version /V/' <<< $v)

if [ "$highestVersionNumber" == "$versionShort" ]
then
echo "Folder version number equals file version number"
else
echo "Folder version number doesn't match file version number"
echo "FolderVN = $highestVersionNumber"
echo "FileVN   = $versionShort"
fi

echo " "
echo " "

echo "Checking version number of Manual.docx"
tempfname=$(cat /dev/urandom | tr -cd 'a-z' | head -c 32)

docx2txt.sh Manual.docx >/dev/null
mv Manual.txt $tempfname.txt
v=$(grep -A1 Version $tempfname.txt | xargs)
echo "Manual.docx has the" $v
rm $tempfname.txt

versionShort=$(sed 's/Version /V/' <<< $v)

if [ "$highestVersionNumber" == "$versionShort" ]
then
echo "Folder version number equals file version number"
else
echo "Folder version number doesn't match file version number"
echo "FolderVN = $highestVersionNumber"
echo "FileVN   = $versionShort"
fi

echo " "
