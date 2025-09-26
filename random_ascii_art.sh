#!/usr/bin/bash

image_width=100
image_height=70
image_dir=/home/porygon/Pictures/splash_screen_pics
image=$(find "$image_dir" -type f | shuf -n 1)
chafa --symbols=ascii --format=ansi --fg-only --size="$image_widthx$image_height" $image
