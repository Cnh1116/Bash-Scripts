#!/bin/bash

# Command to get the battery percentage
battery_percentage=$(upower -i /org/freedesktop/UPower/devices/battery_BAT0 | grep percentage | grep -oP '[0-9]+')
# 0%-25% 	Red
# 26%-75% 	Yellow
# 76%-100% 	Green

EndingSequence()
{
	tput sgr0; echo ']'
	exit 0
}

# Display Percent Value
tput bold; echo -n "Frostbite's battery percentage: " && echo -n $battery_percentage && echo '%'

# Opening Bracket
echo -n '['


# RED Logic
if [[ "$battery_percentage" -le 25 ]]; then
	for((i=0;i<$battery_percentage;i++)); do
		tput setaf 9; echo -n '='
	done
	for ((i=0;i<$((100-$battery_percentage));i++)); do
		tput setaf 15; echo -n "-"
	done
	EndingSequence
else
	for((i=0; i<25; i++)); do
		tput setaf 9; echo -n '='
	done
fi

battery_percentage=$(($battery_percentage - 25))

#Yellow Logic
if [[ "$battery_percentage" -le 50 ]]; then
	for((i=0;i<$battery_percentage;i++)); do
		tput setaf 11; echo -n '='
	done
	for ((i=0;i<$((75 - $battery_percentage));i++)); do
		tput setaf 15; echo -n '-'
	done
	EndingSequence
else
	for((i=0;i<50;i++)); do
		tput setaf 11; echo -n '='
	done
fi

battery_percentage=$(($battery_percentage - 50))
#Green Logic
for((i=0;i<$battery_percentage;i++)); do
	tput setaf 10; echo -n '='
done
for((i=0;i<$((25-$battery_percentage));i++)); do
	tput setaf 15; echo -n '-'
done
EndingSequence
