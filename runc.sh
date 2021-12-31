#!/bin/bash

# Author: Roshan Bellary

# Description: A bash program for Macs that runs a c++ program then deletes the created executable

# Input: program name excluding .cpp end(ie if you wanted to execute a program called helloworld.cpp, you would run "runc helloworld")

# Output: standard output from executed program and also errors if program fails to execute

function runc(){
	x=$1
	out=$x
    x+=".cpp"
    g++ --std=c++17 -Wall $x -o $out
    echo ""
    ./$out
    rm ./$out
}
