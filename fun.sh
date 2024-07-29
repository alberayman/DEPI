#!/bin/bash

func_add ()
{
  echo "function parameters are "$1 $2
  local x=$1
  local y=$2
  local result=$(($x+$y))
  echo $result
}

func_add $1 $2


