#!/bin/bash

# Executa o bash dentro do container 'app' e roda os comandos necessários
docker compose exec app bash -c "
    composer install &&
    cp .env.example .env &&
    php artisan key:generate &&
    php artisan migrate &&
    php artisan storage:link
"
