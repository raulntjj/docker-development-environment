#!/bin/bash

# Reinicia a execução quando algum erro acontece
echo "Running entrypoint"
set -e

# Instalando depedências
echo "Running composer install/update..."
composer install || composer update
echo "Dependencies installed"

# Certifique-se de que o .env está presente
if [ ! -f .env ]; then
  echo "Copying .env.example to .env"
  cp .env.example .env
  echo "File copied."
fi

# Setando permissao para GIT no diretorio
echo "Running command for git configs..."
git config --global --add safe.directory /var/www
echo "Git configured."

# Gera a chave da aplicação Laravel
echo "Generating application key..."
php artisan key:generate --force
echo "Key generated."

# Aguardando MYSQL iniciar
echo "Waiting for MYSQL to start..."
sleep 30
echo "MYSQL started."

# rodando migrations
echo "Running migrations..."
php artisan migrate --force

# Seta permissões para alterações no projeto
echo "Setting permissions..."
chmod -R 777 .
echo "Permissions granted."

echo "Entrypoint finished."

# Executa qualquer comando que tenha sido fornecido via docker-compose ou linha de comando
exec "$@"
