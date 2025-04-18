#!/bin/bash

for i in $(seq 0 256); do tput setaf $i; echo "$i: 1234567890"; tput sgr0; done
