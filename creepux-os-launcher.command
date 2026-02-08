#!/bin/bash

CONFIG_URL="https://raw.githubusercontent.com/SunsetLoom7594/creepux-download-files/main/config.lua"
TMP_CONFIG="onfig.lua"

# ---- Load local config ----
if [[ ! -f config.lua ]]; then
    echo "config.lua not found."
    read -p "Press Enter to exit"
    exit 1
fi

VERSION=$(lua -e 'print(dofile("config.lua").version)')
NAME=$(lua -e 'print(dofile("config.lua").name)')
PLATFORM=$(lua -e 'print(dofile("config.lua").platform)')

echo "Welcome to Creepux OS | Version $VERSION | For Linux"
echo "==================="

while true; do
    read -p "users-local: " option

    if [[ "$option" == "help" ]]; then
        echo "Available commands:"
        echo "  help    - show this message"
        echo "  info    - display system info"
        echo "  update  - check for updates"
        echo "  exit    - quit installer"

    elif [[ "$option" == "info" ]]; then
        echo "Current Creepux OS Info"
        echo "  Name:     $NAME"
        echo "  Version:  $VERSION"
        echo "  Platform: $PLATFORM"

    elif [[ "$option" == "update" ]]; then
        echo "Checking for updates..."

        if ! wget -q -O "$TMP_CONFIG" "$CONFIG_URL"; then
            echo "Failed to contact update server."
            continue
        fi

        REMOTE_VERSION=$(lua -e 'print(dofile("'"$TMP_CONFIG"'").version)')

        echo "Local version : $VERSION"
        echo "Remote version: $REMOTE_VERSION"

        if [[ "$REMOTE_VERSION" == "$VERSION" ]]; then
            echo "You are already up to date."
        else
            echo "Update available!"
            read -p "Do you want to update config.lua? (Y/N): " ans

            if [[ "$ans" == "Y" ]]; then
                mv "$TMP_CONFIG" config.lua
                echo "Config updated."

                # Reload values
                VERSION=$(lua -e 'print(dofile("config.lua").version)')
                NAME=$(lua -e 'print(dofile("config.lua").name)')
                PLATFORM=$(lua -e 'print(dofile("config.lua").platform)')

                echo "Now running version $VERSION"
            else
                echo "Update skipped."
                rm -f "$TMP_CONFIG"
            fi
        fi

    elif [[ "$option" == "exit" ]]; then
        echo "Exiting installer."
        break

    else
        echo "Unknown command: $option"
    fi
done
