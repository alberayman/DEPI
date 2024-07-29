#!/bin/bash

#echo "Welcome"
#mkdir ./my_folder
#cd my_folder
#touch file1.txt && touch file2.txt && touch file3.txt
c=5
let c+=1
echo "$c"
#echo "5 + 5" | bc
###Array###
my_array=("DevOpd" "ITI" "NTI" "Linux")
echo ${my_array[@]}
declare -a names_array
names_array[0]="Alber"
names_array[1]="Ayman"
echo ${names_array[*]}
echo "print arrya indexes"
echo ${!names_array[@]}
sub_array=("GIT" "Bash")
echo ${#sub_array[@]}
sub_array=("DevOps" ${sub_array[@]})
echo "adding first Array element" + ${sub_array[@]}
sub_array=(${sub_array[@]} "Docker")
echo "Adding last Element in Array" + ${sub_array[@]}
echo "Another Way to add Elemet to an array at the end"
sub_array+=("TerraForm")
echo ${sub_array[@]}

w=(${my_array[@]})
echo "W"+ ${w[@]}
z=(${sub_array[@]})
echo "Z" + ${z[@]}
two_arrays=(${w[@]} ${z[@]})
echo ${two_arrays[@]}

echo "Get certain Elements in Array" ${two_arrays[@]:0:2}
my_array[0]="DevOps"

echo ${my_array[@]} + ${!my_array[@]} + ${#my_array[@]}

echo "Two dimensions Array"
declare -A userdata 
userdata["username"]="Alber"
userdata["password"]="MyP@ssw0rd"
userdata["lastlogin"]="$(date)"
unset userdata

echo "values" ${userdata[@]}
echo "Keys"   ${!userdata[*]}
echo "#### append to the 2D Array####"

userdata["isadmin"]="false"

unset userdata["isadmin"]
echo "values" ${userdata[@]}

echo "Keys"   ${!userdata[*]}

