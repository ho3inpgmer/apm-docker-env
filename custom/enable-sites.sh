#!/bin/bash


config_directory="/etc/apache2/sites-available"


for config_file in "$config_directory"/*.conf; do
    if [ -f "$config_file" ]; then
        config_filename=$(basename "$config_file")
        site_name="${config_filename%.*}"
        a2ensite "$site_name"
        #echo "$config_filename"
        #echo "$site_name"
        #echo "Enabled $config_file"
    fi
done

apache2ctl -D FOREGROUND
