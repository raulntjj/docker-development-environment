#!/bin/bash

cd /var/www

composer update
cp .env.example .env
php artisan key:generate
php artisan storage:link
chmod -R 777 /var/www
