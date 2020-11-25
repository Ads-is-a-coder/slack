#!/bin/bash
#
# Usage bootstrap.sh <action>
#
set -euo pipefail
create ()
{
    #update and install package
    sudo apt-get update -y
    wait
    sudo apt-get install apache2 -y
    wait
    sudo apt install php7.2 -y
    wait
    sudo apt install libapache2-mod-php -y
    wait
    sudo a2enmod php7.2
    echo $'<?php\n\nheader("Content-Type: text/plain");\n\necho"Hello World!";\n\n?>' | sudo tee /var/www/html/index.php
    #make index.php default
    sudo rm -rf /etc/apache2/mods-enabled/dir.conf
    echo $'<IfModule mod_dir.c>\n\tDirectoryIndex index.php\n</IfModule>' | sudo tee /etc/apache2/mods-enabled/dir.conf
    sudo systemctl restart apache2
}

delete ()
{ 
    #deletes previously installed packages
    sudo apt-get remove apache2 -y
    wait
    sudo apt remove php -y
    wait
    sudo apt remove libapache2-mod-php -y
}

main()
{
    local action="$1"

    #checks action is available for execution
    available_actions=(create \
                      delete )

    if [[ ! " ${available_actions[@]} " =~ " ${action} " ]]; then
        echo "Invalid action"
        echo "Available Actions: ${available_actions[*]}"
        exit 1
    fi
   # Perform the requested action
   "${action}"
}

main "$@"
