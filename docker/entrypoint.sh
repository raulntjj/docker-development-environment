#!/bin/bash

# Reinicia a execução quando algum erro acontece
echo "Executando entrypoint"
set -e

# Instalando depedências
echo "Executando composer install/update..."
composer install || composer update
echo "Dependências instaladas"

# Certifique-se de que o .env está presente
if [ ! -f .env ]; then
  echo "Copiando arquivo .env.example para .env"
  cp .env.example .env
  echo "Arquivo copiado."
fi

# Gera a chave da aplicação Laravel
echo "Gerando chave da aplicação..."
php artisan key:generate
echo "Chave gerada."

# Aguardando MYSQL iniciar
echo "Aguardando MYSQL iniciar..."
sleep 30
echo "MYSQL iniciado."

# Executa as migrações do banco de dados
echo "Executando as migrações..."
php artisan migrate --force
# Seta permissões para alterações no projeto
echo "Setando permissões..."
chmod -R 777 .
echo "Permissões concedida."

echo "Entrypoint executado."
# Execute qualquer comando que tenha sido fornecido via docker-compose ou linha de comando
exec "$@"
