#!/bin/bash

if ! command -v lua >/dev/null; then
    echo "Lua is not installed"
    read -p "Press Enter to exit"
    exit 1
fi

if [[ ! -f config.lua ]]; then
    echo "config.lua not found"
    read -p "Press Enter to exit"
    exit 1
fi

VERSION=$(lua config.lua)

echo "Welcome to Creepux OS | Version $VERSION | For Linux"

read -p "Press Enter to exit"

echo "==================="
read -p "Awaiting input" option

if [[ "$option" == "help" ]]; then
  echo "Recieved: help"
fi
