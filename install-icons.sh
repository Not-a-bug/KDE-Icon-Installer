#!/bin/bash

############################################################
# CONSTANTS: TEXT FORMATING
############################################################

BOLD=1
UNDERLINE=4
RED=31
GREEN=32
BRIGHT_GREEN=92
RESET=0
NEW_LINE="\n"

#####################################################
#   FUNCTIONS - UTILS
#####################################################

color_echo() {
    local color=""
    color=$1; shift
    if [[ -z "$color" ]]; then
        color="$RESET"
    fi
    echo -e "\e[${color}m${@}\e[${RESET}m"
}

error_echo() {
    color_echo "$RED;$BOLD" "$1"
}

install_icons() {
    # Install icons
    echo "Installing icons..."
    for f in ./icons/*.png; do
        filename=$(basename "$f" ".png")
        base_name=$(echo $filename | sed -E 's/-[0-9]+$//g')
        size=$(echo $filename | sed -E 's/^.*-([0-9]+)$/\1/g')

        echo "Installing : $base_name / Size : $size"
        xdg-icon-resource install --novendor --size "$size" "$f" "$base_name"
        if [[ $? -eq 0 ]]; then
            color_echo "$BRIGHT_GREEN" "OK!"
        else
            error_echo "Error: \"$f\". Naming convention should be <icon_name-size>, e.g., flaticon-512.png"
        fi
    done
}

#####################################################
#   MAIN
#####################################################

install_icons
