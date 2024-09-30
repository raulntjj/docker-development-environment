#!/bin/bash

# Função para verificiar se host foi criado, caso não cria o host
add_host_entry() {
    IP="$1"
    HOSTNAME="$2"

    if grep -q "$IP $HOSTNAME" /etc/hosts; then
        echo -e "\e[1;32mHost ready for connection\e[0m"
    else
        echo "Adding $IP $HOSTNAME to /etc/hosts..."
        echo "$IP $HOSTNAME" | sudo tee -a /etc/hosts > /dev/null
        echo -e "\e[1;32mHost added and ready for connection\e[0m"
    fi
}

add_host_entry "127.0.0.1" "raulntjj.com.br"

export $(grep -v '^#' ./docker/.env.docker | xargs)

# Verificando se a porta DB_está ocupada
if lsof -Pi :$DB_PORT -sTCP:LISTEN -t >/dev/null ; then
  echo -e "\e[1;31mPort $DB_PORT is in use, stop the process occupying it or change the port.\e[0m"
  exit 1
fi
echo -e "\e[1;32mPort $DB_PORT ready for MYSQL connection\e[0m"

# Verificando se a porta MYADMIN_está ocupada
if lsof -Pi :$MYADMIN_PORT -sTCP:LISTEN -t >/dev/null ; then
  echo -e "\e[1;31mPort $MYADMIN_PORT is in use, stop the process occupying it or change the port.\e[0m"
  exit 1
fi
echo -e "\e[1;32mPort $MYADMIN_PORT ready for PHPMYADMIN connection\e[0m"

# Verificando se a porta NGINX_está ocupada
if lsof -Pi :$NGINX_PORT -sTCP:LISTEN -t >/dev/null ; then
  echo -e "\e[1;31mPort $NGINX_PORT is in use, stop the process occupying it or change the port.\e[0m"
  exit 1
fi
echo -e "\e[1;32mPort $NGINX_PORT ready for NGINX connection\e[0m"
