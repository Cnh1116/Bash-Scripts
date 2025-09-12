#!/usr/bin/bash
#
af_white=231
af_pink=213
af_blue=51
echo "===~~~===~~~===~~~===~~~===~~~===~~~===~~~===~~~===~~~===~~~===~~~===~~~===~~~===~~~===~~~===~~~"
echo ""
tput setaf $af_pink
echo -n "                                          "; tput setaf $af_white; echo -n "|"; tput setaf $af_pink; tput bold; echo -n "Name: "; tput sgr0; tput setaf $af_blue; echo "Carson Holland"
echo -n "                                          "; tput setaf $af_white; echo -n "|"; tput setaf $af_pink; tput bold; echo -n "Title: "; tput sgr0; tput setaf $af_blue; echo "Software Engineer in Test II"
echo -n "                                          "; tput setaf $af_white; echo -n "|"; tput setaf $af_pink; tput bold; echo -n "Company: "; tput sgr0; tput setaf $af_blue; echo "Everfox"
echo -n "                                          "; tput setaf $af_white; echo -n "|"; tput setaf $af_pink; tput bold; echo -n "Skills: "; tput sgr0; tput setaf $af_blue; echo "Python and Bash automation"
echo -n "                                          "; tput setaf $af_white; echo -n "|"; tput setaf $af_pink; tput bold; echo -n "Education: "; tput sgr0; tput setaf $af_blue; echo "Texas State University 2024"
echo ""
tput setaf $af_white
echo "===~~~===~~~===~~~===~~~===~~~===~~~===~~~===~~~===~~~===~~~===~~~===~~~===~~~===~~~===~~~===~~~"

