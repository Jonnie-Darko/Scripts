#!/bin/bash

#---------File or Directory

echo "Are you looking for a (1)File or a (2)Directory? "

read RnD

#---------Decide Case-Sensitivity

echo "Is it case-sensitive?(y/n)"

read case_sens

#---------Gather File Type

echo "Is your a file a(n)" 
echo "(1) Text File"
echo "(2) Shell File"
echo "(3) Log File"
echo "(4) Unknown"
echo "(5) DIRECTORY"

read file_type

#---------Gather Name of File/Directory

echo "What is the name of the file/directory? (Use "*" if you are unsure of name)."

read file_name

#---------ELIF to determine File/Directory

if [ $RnD == 1 ]; then

	type_option="f"

elif [ $RnD == 2 ]; then

	type_option="d"

fi

#--------IF ELSE to determine Case Sensitivity

if [ $case_sens == "y" ]; then

	name_type="-name"


#else
	name_type=-"iname"
elif [ $case_sens == "n" ]; then

	name_type="-iname"

fi

#--------ELIF to determine File Type

if [ $file_type == 1 ]; then

        file_option=".txt"

elif [ $file_type == 2 ]; then

        file_option=".sh"

elif [ $file_type == 3 ]; then

	file_option=".log"

elif [ $file_type == 4 ]; then

	file_option=".*"

elif [ $file_type == 5 ]; then

:

fi

#---------Run the FIND commands


find -type $type_option $name_type $file_name$file_option
