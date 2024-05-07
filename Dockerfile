# základní Docker obraz s PHP a Apache
FROM php:8-apache

# aktualizace systému
RUN apt update && apt upgrade -y

# instalace rozšíření pro XSL procesor
RUN apt install -y libxslt1-dev
RUN docker-php-ext-install xsl

# instalace rozšíření mysqli pro komunikaci s mysql databází
RUN docker-php-ext-install mysqli && docker-php-ext-enable mysqli

# úklid dále nepotřebných souborů
RUN apt remove -y libxslt1-dev icu-devtools libicu-dev libxml2-dev
RUN rm -rf /var/lib/apt/lists/*