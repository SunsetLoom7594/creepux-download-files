#!/bin/bash

VERSION=$(lua -e 'print(dofile("config.lua").version)')

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

    else
        echo "Unknown command: $option"
    fi
done
