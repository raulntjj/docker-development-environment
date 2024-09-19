#!/bin/bash

# Abort on any error (including if wait-for-it fails).
set -e

# Dentro do container, assegure-se de que as dependências estejam instaladas
echo "Executando composer install/update..."
composer install || composer update

# Certifique-se de que o .env está presente
if [ ! -f .env ]; then
  echo "Copiando arquivo .env.example para .env"
  cp .env.example .env
fi

# Gera a chave da aplicação Laravel
echo "Gerando chave do Laravel..."
php artisan key:generate

# Aguardando MYSQL iniciar
echo "Aguardando MYSQL iniciar..."
sleep 10

# Executa as migrações do banco de dados
echo "Executando as migrações..."
php artisan migrate --force

# Seta permissões para alterações no projeto
echo "Setando permissões..."
chmod -R 777 .

# Execute qualquer comando que tenha sido fornecido via docker-compose ou linha de comando
exec "$@"
