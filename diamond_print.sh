#!/bin/bash

PrintTopTriangle()
{
	for((i=1;i<$1;i=i+2)); do
		number_of_spaces_each_side=$(expr $(expr $1 - $i) / 2)
		for ((x=1;x<$number_of_spaces_each_side;x++)); do
			echo -n '-'
		done

		for((y=1;y<=$i;y++)); do
			echo -n '*'
		done

		for((z=1;z<$number_of_spaces_each_side;z++)); do
			echo -n '-'
		done
		echo " "
	done
}

if [ $(($1 % 2)) != 1 ]; then
	echo "Triangle max character width is not ODD. Exiting $0..."
	exit 1	
else
	PrintTopTriangle $1
fi
