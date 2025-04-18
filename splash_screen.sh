#!/bin/bash


# TEXT MANIPULATION
blue="tput setaf 123"
pink="tput setaf 162"
bold="tput bold"
default_color="tput sgr0"

# Image Parameters
image=/home/porygon/Pictures/porygon-basic-image.png
image_width=80
image_height=60

# Temp File Locations
image_tmp=/tmp/splash_screen.txt
system_info=/tmp/system_info.txt

if [ -f $image_tmp ]; then
	rm $image_tmp
fi

if [ -f $system_info ]; then
	rm $system_info
fi

# Generate the ascii art
chafa --symbols=ascii --format=ansi --fg-only --size="$image_widthx$image_height" $image > $image_tmp


# Printing Function
print_information()
{
	$pink >> $system_info
	$bold >> $system_info
	echo -n "$1" >> $system_info
	$default_color >> $system_info
	$blue >> $system_info
	echo $2 >> $system_info

}

# TEXT TO PRINT SIDE OF THE IMAGE
$bold >> $system_info 
$pink >> $system_info
echo -n $(whoami) >> $system_info
$default_color >> $system_info
$blue >> $system_info
echo -n "@" >> $system_info
$bold >> $system_info
$pink >> $system_info
echo $(hostname )>> $system_info

user_and_hostname="$(whoami)@$(hostname)"
for i in $(seq 0 ${#user_and_hostname}); do
	echo -n "~" >> $system_info
done
echo "" >> $system_info


home_disk_usage=$(df -h /home | awk 'NR > 1{print $3}')
home_disk_size=$(df -h /home | awk 'NR > 1{print $2}')
home_disk_perc_used=$(df -h /home | awk 'NR > 1{print $5}')

print_information "CPU Model: " "$(lscpu | grep -oP '^Model name:\s+\K.+')"
print_information "CPU Architecture " "$(lscpu | grep -oP '^Architecture:\s+\K.+')"
print_information "OS: "  "$(grep '^PRETTY_NAME=' /etc/os-release | cut -d= -f2 | tr -d ' ')"
print_information "Kernel: " "$(uname -r)"
print_information "Disk Usage /Home: " "$home_disk_usage/$home_disk_size ($home_disk_perc_used)"
print_information "Desktop: " "$XDG_CURRENT_DESKTOP"
print_information "Shell: " "$SHELL"

# GET LINE LISTS OF IMAGE AND INFO
IMAGE_LINES=$(wc -l < $image_tmp | tr -d ' ')
SYSTEM_INFORMATION_LINES=$(wc -l < $system_info | tr -d ' ')


paste -d " " $image_tmp $system_info
