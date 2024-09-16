#!/bin/bash

docker-compose exec app composer update
docker-compose exec app chmod -R 777 .
docker-compose exec app cp .env.example .env
docker-compose exec app php artisan key:generate
docker-compose exec app php artisan storage:link
docker-compose exec app php artisan migrate --force