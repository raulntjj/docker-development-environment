#!/bin/bash

add_host_entry() {
    IP="$1"
    HOSTNAME="$2"

    if grep -q "$IP $HOSTNAME" /etc/hosts; then
        echo -e "\e[1;32mHost pronto para conexão\e[0m"
    else
        echo "Adicionando $IP $HOSTNAME ao /etc/hosts..."
        echo "$IP $HOSTNAME" | sudo tee -a /etc/hosts > /dev/null
        echo -e "\e[1;32mHost adicionado e pronto para conexão\e[0m"
    fi
}

# Utilizando a variável do .env.docker
add_host_entry "127.0.0.1" "raulntjj.com.br"

# Verificar se a porta DB_PORT está ocupada
if lsof -Pi :$DB_PORT -sTCP:LISTEN -t >/dev/null ; then
  echo -e "\e[1;31mPorta $DB_PORT em uso, pare o processo que está oucupando ou mude a porta.\e[0m"
  exit 1
fi
echo -e "\e[1;32mPorta $DB_PORT pronta para conexão do MYSQL\e[0m"

# Verificar se a porta MYADMIN_PORT está ocupada
if lsof -Pi :$MYADMIN_PORT -sTCP:LISTEN -t >/dev/null ; then
  echo -e "\e[1;31mPorta $MYADMIN_PORT em uso, pare o processo que está oucupando ou mude a porta.\e[0m"
  exit 1
fi
echo -e "\e[1;32mPorta $MYADMIN_PORT pronta para conexão do PHPMYADMIN\e[0m"

# Verificar se a porta NGINX_PORT está ocupada
if lsof -Pi :$NGINX_PORT -sTCP:LISTEN -t >/dev/null ; then
  echo -e "\e[1;31mPorta $NGINX_PORT em uso, pare o processo que está oucupando ou mude a porta.\e[0m"
  exit 1
fi
echo -e "\e[1;32mPorta $NGINX_PORT pronta para conexão do NGINX\e[0m"
