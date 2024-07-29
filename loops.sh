#!/bin/bash

###For Loop####

for number in {1..10}
do
	echo "Number is":$number

done

###3 Expression loop###
for ((i=0; i<5; i++))
do
	echo "Current number is : "$i
done


###While Loops###
y=1
while [ $y -lt 6 ]
do 
	echo "Y current number is :" $y
	let y+=1
done

