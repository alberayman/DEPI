#!/bin/bash
echo "Choose an optin: "
echo "1) Enter your name "
echo "2) show date"
echo "3) show Directory"

read -p "enter a  word " string
#case "$string" in 
#	"Hello") echo "Hello";;
#        "bye")   echo "Bye";;
#	*)      echo "not found"

#esac

case "$string" in 
	1) echo "Hello "$string;;
	2)echo "today date is "$(date);;
	3)echo "Current directory is "$PWD;;
	#4) break ;;
	*) echo "Not a valid optiom"
esac

echo $0
echo $1
