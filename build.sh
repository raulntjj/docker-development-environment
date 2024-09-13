add_host_entry() {
    IP="$1"
    HOSTNAME="$2"

    # Verifica se a entrada já existe
    if grep -q "$IP $HOSTNAME" /etc/hosts; then
        echo "Host ok"
    else
        echo "Adicionando $IP $HOSTNAME ao /etc/hosts"
        echo "$IP $HOSTNAME" | sudo tee -a /etc/hosts > /dev/null
    fi
}

# Adicionando as entradas desejadas
add_host_entry "127.0.0.1" "ntjj.dev"
