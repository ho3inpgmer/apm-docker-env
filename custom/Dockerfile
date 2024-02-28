FROM php:8.0-apache

ENV COMPOSER_ALLOW_SUPERUSER=1

RUN apt-get update && apt-get install -y libcurl4-openssl-dev pkg-config libssl-dev zlib1g-dev libpng-dev libjpeg-dev libfreetype6-dev libjpeg62-turbo-dev \
    libmcrypt-dev libgd-dev jpegoptim \
    jpegoptim optipng pngquant gifsicle \
    libonig-dev \
    libxml2-dev \
    zip \
    sudo \
    unzip \
    npm \
    nodejs

RUN npm install -g yarn

RUN docker-php-ext-install mysqli pdo pdo_mysql && docker-php-ext-enable pdo_mysql

RUN docker-php-ext-configure gd --enable-gd --with-freetype --with-jpeg

RUN docker-php-ext-install gd

RUN pecl install redis \
&& docker-php-ext-enable redis

RUN a2enmod ssl

RUN a2enmod rewrite

CMD service apache2 start


COPY enable-sites.sh /usr/local/bin/
RUN chmod +x /usr/local/bin/enable-sites.sh

ENTRYPOINT ["/bin/bash", "/usr/local/bin/enable-sites.sh"]

CMD service apache2 reload
#CMD ["apache2-foreground"]
#CMD ["/usr/sbin/apachectl", "-D", "FOREGROUND"]
