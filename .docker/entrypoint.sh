#!/bin/bash
chown www-data bootstrap/cache storage -R

composer install

php artisan key:generate
php artisan migrate
php-fpm
