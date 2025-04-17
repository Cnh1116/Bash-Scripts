#!/bin/bash


# Image Parameters
image=/home/porygon/Pictures/porygon-basic-image.png
image_width=80
image_height=30

# Temp File Locations
image_tmp=/tmp/splash_screen.txt
system_info=/tmp/system_info.txt

if [ -f $image_tmp ]; then
	rm $image_tmp
fi

if [ -f $system_info ]; then
	rm $system_info
fi

chafa --symbols=ascii --format=ansi --fg-only --size="$image_widthx$image_height" $image > $image_tmp

# TEXT TO PRINT SIDE OF THE IMAGE
lscpu | grep -oP '^Model name:\s+\K.+' >> $system_info
lscpu | grep -oP '^Architecture:\s+\K.+' >> $system_info

IMAGE_LINES=$(wc -l < $image_tmp | tr -d ' ')
SYSTEM_INFORMATION_LINES=$(wc -l < $system_info | tr -d ' ')

if [ "$SYSTEM_INFORMATION_LINES" -lt "$IMAGE_LINES" ]; then
    awk -v n=$((IMAGE_LINES - SYSTEM_INFORMATION_LINES)) 'BEGIN { for (i=0; i<n; i++) print "" }' >> "$SYSTEM_INFORMATION_LINES"
fi

paste -d " " $image_tmp $system_info
