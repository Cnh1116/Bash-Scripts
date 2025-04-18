#!/bin/bash


# Image Parameters
image=/home/porygon/Pictures/porygon-basic-image.png
image_width=80
image_height=50

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


# TEXT TO PRINT SIDE OF THE IMAGE
user_and_hostname="$(whoami)@$(hostname)"
echo $user_and_hostname >> $system_info

for i in $(seq 0 ${#user_and_hostname}); do
	echo -n "~" >> $system_info
done
echo "" >> $system_info

echo "CPU Model: $(lscpu | grep -oP '^Model name:\s+\K.+')" >> $system_info
echo "CPU Architecture: $(lscpu | grep -oP '^Architecture:\s+\K.+')" >> $system_info
echo "OS: $(grep '^PRETTY_NAME=' /etc/os-release | cut -d= -f2 | tr -d ' ')" >> $system_info
echo "Kernel: $(uname -r)" >> $system_info

home_disk_usage=$(df -h /home | awk 'NR > 1{print $3}')
home_disk_avail=$(df -h /home | awk 'NR > 1{print $4}')
home_disk_perc_used=$(df -h /home | awk 'NR > 1{print $5}')
echo "/Home Avail: $home_disk_avail Used: $home_disk_usage $home_disk_perc_used" >> $system_info
echo "Desktop: $XDG_CURRENT_DESKTOP" >> $system_info
echo "Shell: $SHELL" >> $system_info

# GET LINE LISTS OF IMAGE AND INFO
IMAGE_LINES=$(wc -l < $image_tmp | tr -d ' ')
SYSTEM_INFORMATION_LINES=$(wc -l < $system_info | tr -d ' ')

if [ "$SYSTEM_INFORMATION_LINES" -lt "$IMAGE_LINES" ]; then
    awk -v n=$((IMAGE_LINES - SYSTEM_INFORMATION_LINES)) 'BEGIN { for (i=0; i<n; i++) print "" }' >> "$SYSTEM_INFORMATION_LINES"
fi

paste -d " " $image_tmp $system_info
