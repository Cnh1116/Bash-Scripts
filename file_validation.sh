#!/bin/bash
# This is a practice BASH script to learn better script structure, creating functions, and passing/returning values to/from functions.

ReadFilePath()
{
	read -p "Please enter a File Path to Validate: " file_path
	echo "$file_path"
}

ValidateFilePathExists()
{
	[ -d "$1" ] && echo $(ListDirectoryContents $1) && return 0
	[ -f "$1" ] && echo $(OutputFileContents $1) && return 0
	echo "$1 Is not a valid Directory or File" && return 1
}

ListDirectoryContents()
{
	echo "--------------------$(date)--------------------" >> directory_contents.txt
	ls -l "$1" >>  directory_contents.txt  #List contents of the directory from ValidateFilePathExists() method call
	echo "Appending the directory contents to: $(pwd)/directory_contents.txt"
}

OutputFileContents()
{
	echo "--------------------$(date)--------------------" >> file_contents.txt
	cat "$1" >>  file_contents.txt  #Output the contents of the file from the ValidateFilePathExists() method call
	echo "Appending File contents to: $(pwd)/file_contents.txt"
}


my_file_path=$(ReadFilePath)
ValidateFilePathExists "$my_file_path"
