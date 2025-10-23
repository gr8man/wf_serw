FROM serversideup/php:8.2-fpm-apache

USER root

# Instalacja rozszerzenia intl (zgodnie z oryginałem)
RUN apt-get update && \
    apt-get install -y libicu-dev && \
    docker-php-ext-install intl && \
    apt-get clean && \
    rm -rf /var/lib/apt/lists/*


# Instalacja serwera Redis i rozszerzenia PHP
# 1. Instalacja pakietu serwera Redis oraz zależności dla rozszerzenia PHP.
# 2. Instalacja rozszerzenia Redis dla PHP.
# 3. Aktywacja rozszerzenia w PHP.
# 4. Czyszczenie.
RUN apt-get update && \
    apt-get install -y redis-server libssl-dev && \
    docker-php-ext-enable redis && \
    apt-get clean && \
    rm -rf /var/lib/apt/lists/*

USER www-data
