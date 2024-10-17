#!/bin/bash

log_info() {
    echo
   log_info "\e[1;36m$1\e[0m"
    echo
}

log_success() {
    echo
   log_info "\e[1;32m$1\e[0m"
    echo
}

# Função para verificiar se host foi criado, caso não cria o host
add_host_entry() {
    IP="$1"
    HOSTNAME="$2"

    if grep -q "$IP $HOSTNAME" /etc/hosts; then
       log_info "Host ready for connection"
    else
        echo "Adding $IP $HOSTNAME to /etc/hosts..."
        echo "$IP $HOSTNAME" | sudo tee -a /etc/hosts > /dev/null
       log_info "Host added and ready for connection"
    fi
}

add_host_entry "127.0.0.1" "raulntjj.com.br"

export $(grep -v '^#' ./docker/.env.docker | xargs)

# Verificando se a porta DB_está ocupada
if lsof -Pi :$DB_PORT -sTCP:LISTEN -t >/dev/null ; then
 log_info "Port $DB_PORT is in use, stop the process occupying it or change the port."
  exit 1
fi
log_success "Port $DB_PORT ready for MYSQL connection"

# Verificando se a porta MYADMIN_está ocupada
if lsof -Pi :$MYADMIN_PORT -sTCP:LISTEN -t >/dev/null ; then
 log_info "Port $MYADMIN_PORT is in use, stop the process occupying it or change the port."
  exit 1
fi
log_success "Port $MYADMIN_PORT ready for PHPMYADMIN connection"

# Verificando se a porta NGINX_está ocupada
if lsof -Pi :$NGINX_PORT -sTCP:LISTEN -t >/dev/null ; then
 log_info "Port $NGINX_PORT is in use, stop the process occupying it or change the port."
  exit 1
fi
log_success "Port $NGINX_PORT ready for NGINX connection"
