#!/bin/bash

# Reinicia a execução quando algum erro acontece
echo "Running entrypoint"
set -e

log_info() {
    echo
    echo -e "\e[1;36m$1\e[0m"
    echo
}

log_success() {
    echo
    echo -e "\e[1;32m$1\e[0m"
    echo
}

# Instalando depedências
log_info "Running composer install/update..."
composer install || composer update
log_success "Dependencies installed"

# Certifique-se de que o .env está presente
if [ ! -f .env ]; then
  log_info "Copying .env.example to .env"
  cp .env.example .env
  log_success "File copied."
fi

# Setando permissao para GIT no diretorio
log_info "Running command for git configs..."
git config --global --add safe.directory /var/www/
log_success "Git configured."

# Gera a chave da aplicação Laravel
log_info "Generating application key..."
php artisan key:generate --force
log_success "Key generated."

# Aguardando MYSQL iniciar
log_info "Waiting for MYSQL to start..."
sleep 30
log_success "MYSQL started."

# rodando migrations
log_info "Running migrations..."
php artisan migrate --force

# Seta permissões para alterações no projeto
log_info "Setting permissions..."
chmod -R 777 .
log_success "Permissions granted."

log_success "Entrypoint finished."

# Executa qualquer comando que tenha sido fornecido via docker-compose ou linha de comando
exec "$@"
