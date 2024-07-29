#!/bin/bash


file=conditional.sh
#x=5


if [[  -e $file && -s $file ]]; then
echo "True"
else
echo "False"
fi

str1="Alber"
str2="Alber"
if [[  $str1 == $str2 && -z $str1 ]]; then
	echo "string match"
else 
	echo "String not match or not empty "
fi
