FROM serversideup/php:8.2-fpm-apache

USER root

RUN apt-get update && \
    apt-get install -y libicu-dev && \
    docker-php-ext-install intl && \
    apt-get clean && \
    rm -rf /var/lib/apt/lists/*

USER www-data
