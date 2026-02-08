#!/bin/bash

VERSION=$(lua -e 'print(dofile("config.lua").version)')
NAME=$(lua -e 'print(dofile("config.lua").name)')
PLATFORM=$(lua -e 'print(dofile("config.lua").platform)')


echo "Welcome to Creepux OS | Version $VERSION | For Linux"


echo "==================="
read -p "Awaiting input   " option

while true; do
    read -p "Awaiting input: " option

    if [[ "$option" == "help" ]]; then
        echo "Available commands:"
        echo "  help  - show this message"
        echo "  exit  - quit installer"

    elif [[ "$option" == "exit" ]]; then
        echo "Exiting installer."
        break
    elif [[ "$option" == "info" ]]; then
        echo "Current Creepux OS Info"
        echo "  Version: $VERSION"
        echo "  Name: $NAME"
        echo "  Platform: $PLATFORM"
    else
        echo "Unknown command: $option"
    fi
done
