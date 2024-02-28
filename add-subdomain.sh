#!/bin/bash

if [ $# -ne 1 ]; then
    echo "Usage: ./bin/domain.sh <subdomain>"
    exit 1
fi

con_name=app
subdomain=$1


config_file="./apache/${subdomain}.conf"

if [ ! -d "./html/${subdomain}" ]; then
    mkdir -p ./html/${subdomain}
fi

# Create the Apache configuration file
echo "
<VirtualHost *:80>
    Options Indexes FollowSymLinks
    DocumentRoot /var/www/html/${subdomain}/
    ServerName ${subdomain}
    <Directory /var/www/html/${subdomain}/>
        AllowOverride All
        Require all granted
    </Directory>
</VirtualHost>

<VirtualHost *:443>
    Options Indexes FollowSymLinks
    DocumentRoot /var/www/html/${subdomain}/
    ServerName ${subdomain}

    <Directory /var/www/html/${subdomain}/>
        AllowOverride All
        Require all granted
    </Directory>

#    SSLEngine on
#    SSLCertificateFile /etc/apache2/certs/certificate.crt
#    SSLCertificateKeyFile /etc/apache2/certs/private-key.key
</VirtualHost>
" > "${config_file}"

docker exec app a2ensite ${subdomain}

docker exec app service apache2 reload

touch ./html/${subdomain}/index.php

echo "<?php echo 'this is ${subdomain}';" > ./html/${subdomain}/index.php

echo "Subdomain ${subdomain} created successfully!"
