#!/bin/bash

VERSION=$(lua -e 'print(dofile("config.lua").version)')

echo "Welcome to Creepux OS | Version $VERSION | For Linux"


echo "==================="
read -p "Awaiting input   " option

if [[ "$option" == "help" ]]; then
  echo "Recieved: help"
elif [[ "$option" == "exit" ]] then
  echo "Recieved: exit"
  read -p "Press Enter to exit"
fi
