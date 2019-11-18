#!/usr/bin/env bash


# Black        0;30     Dark Gray     1;30
# Red          0;31     Light Red     1;31
# Green        0;32     Light Green   1;32
# Brown/Orange 0;33     Yellow        1;33
# Blue         0;34     Light Blue    1;34
# Purple       0;35     Light Purple  1;35
# Cyan         0;36     Light Cyan    1;36
# Light Gray   0;37     White         1;37

#    .---------- constant part!
#    vvvv vvvv-- the code from above
RED='\033[0;31m'
NC='\033[0m' # No Color

CYAN='\033[0;36m'
BLUE='\033[0;34m'

printf "\n${CYAN}Downloading from github...${NC}\n\n"
wget --continue --output-document src_repo.zip https://github.com/imochoa/beamer-quick-expo/zipball/master 

printf "\n${CYAN}Unzipping...${NC}\n\n"
unzip -o src_repo.zip -d "new_presentation"
# ls new_presentation/ | grep imochoa | head -n1
AUXDIR=$(ls new_presentation | grep imochoa-beamer-quick-expo | head -n 1)
# AUXDIR=$(ls new_presentation | head -n 1)
mv new_presentation/${AUXDIR}/* new_presentation/

printf "\n${CYAN}Cleaning up...${NC}\n\n"
rm src_repo.zip
find new_presentation/${AUXDIR}/ -type f -name ".*" -exec rm -f {} \;
rmdir new_presentation/${AUXDIR}
