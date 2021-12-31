#!/bin/bash

# Author: Roshan Bellary

# Description:A useful bash program that does what the Windows tree command does - prints out the enclosed directories and files within your current directory in a tree format

# Input: (Optional -a parameter to include hidden files in the tree format)

# Output: A formatted list of all files and directories that include your current directory in their absolute paths

rec () {
	for f in *;
	do
		[ -e "$f" ] || [ -L "$f" ] || continue
		space=""
		for a in {0..$(($1-3))};
		do
			n=$((a % 3))
			if [ $n -eq 1 ]; then
				space=$space"|"
			fi
			space=$space" "
		done
		space=$space"L"
		for a in {0..3};
		do
			space=$space"_"
		done
		space=$space"$f"
		echo $space
		if [[ -d $f ]];
		then
			cd $f
			if [ "$(ls .)" ]; then
				sp=$(($1+3))
				rec $sp
			fi
			cd ..
		fi
	done
}
rec2 () {
	for f in $(ls -a);
	do
		if [ $f = "." ]; then
			continue
		fi
		if [ $f = ".." ]; then
			continue
		fi
		[ -e "$f" ] || [ -L "$f" ] || continue
		space=""
		for a in {0..$(($1-3))};
		do
			n=$((a % 3))
			if [ $n -eq 1 ]; then
				space=$space"|"
			fi
			space=$space" "
		done
		space=$space"L"
		for a in {0..3};
		do
			space=$space"_"
		done
		space=$space"$f"
		echo $space
		if [[ -d $f ]];
		then
			cd $f
			if [ "$(ls -a .)" ]; then
				sp=$(($1+3))
				rec2 $sp
			fi
			cd ..
		fi
	done
}
tree(){
	pwd
	param=$1
	if [[ $param = "-a" ]]; then
		rec2 3
	else
		rec 3
	fi
}
