FROM php:7.3.6-fpm-alpine3.9

# Instalando dependencias php
RUN apk add --no-cache openssl bash mysql-client
RUN docker-php-ext-install pdo pdo_mysql

ENV DOCKERIZE_VERSION v0.6.1
RUN wget https://github.com/jwilder/dockerize/releases/download/$DOCKERIZE_VERSION/dockerize-alpine-linux-amd64-$DOCKERIZE_VERSION.tar.gz \
    && tar -C /usr/local/bin -xzvf dockerize-alpine-linux-amd64-$DOCKERIZE_VERSION.tar.gz \
    && rm dockerize-alpine-linux-amd64-$DOCKERIZE_VERSION.tar.gz

WORKDIR /var/www
RUN rm -rf /var/www/html

# Instalando o composer
RUN curl -sS https://getcomposer.org/installer | \
    php -- --install-dir=/usr/local/bin --filename=composer

## Utilizado para gerar uma imagem
# Copia a aplicação para o container
# COPY . /var/www
# RUN composer install \
#    && cp .env.example .env \
#    && php artisan key:generate \
#    && php artisan config:cache

RUN ln -s public html

# Carbon 1 is deprecated, see how to migrate to Carbon 2.
#RUN php ./vendor/bin/upgrade-carbon --no-interaction --quiet

EXPOSE 9000
ENTRYPOINT ["php-fpm"]
