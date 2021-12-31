#!/bin/bash

# Author: Roshan Bellary

# Description: A useful bash program that builds your c++ program and keeps the executable

# Input: program name excluding .cpp end(ie if you wanted to build a program called helloworld.cpp, you would run "runc helloworld")

# Output: standard output from executed program and errors if during build time an error was thrown

function buildc(){
	x=$1
	out=$x
	x+=".cpp"
	g++ --std=c++17 -Wall $x -o $out
	echo ""
	./$out
}