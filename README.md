# Projeto Docker

Este projeto utiliza Docker para simplificar o gerenciamento de containers e serviços do ambiente de desenvolvimento laravel utilizando `MYSQL`, `PHPMYADMIN` e `NGINX`. Este `README` fornece instruções sobre como usar os comandos disponíveis e os pré-requisitos necessários para executar o projeto.

## Pré-requisitos

Antes de começar, certifique-se de ter os seguintes pré-requisitos instalados em sua máquina:

- **Docker**: Ferramenta de containerização. [Instalação do Docker](https://docs.docker.com/get-docker/)
- **Docker Compose**: Ferramenta para definir e executar aplicativos Docker multi-containers. [Instalação do Docker Compose](https://docs.docker.com/compose/install/)
sudo - **Make**: Ferramenta para simplificar execução de multi-comandos, para obter em sua máquina:
```bash
sudo sudo apt-get install make
```

## Configuração Inicial

1. **Clone o repositório na pasta raíz do seu projeto**:

```bash
git clone https://github.com/raulntjj/docker-development-environment
cd docker-development-environment
mv * ../
cd ..
rm -r docker-development-environment --force
```

Ao executar este bloco de comando os arquivos de configuração estarão em seus devidos locais para que funcione corretamente.

2. **Configure o .env.docker se necessário, está no diretório "docker" (Opcional)**:
```bash
# Por padrão:
NGINX_PORT=8989
MYADMIN_PORT=8888
DB_PORT=3307
DB_NAME=sys
DB_PASS=root
```
3. **Defina uma .env.example (Se não possuir), e verifique as credênciais do banco (OBRIGATÓRIO POSSUIR UMA .env.example)**:
```bash
# Configure conforme o que você colocou no .env.docker, caso não tenha alterado,
# deve estar desta forma
DB_CONNECTION=mysql
DB_HOST=db
DB_PORT=3306
DB_DATABASE=sys
DB_USERNAME=root
DB_PASSWORD=root
```

4. **Contrua os containers, para isso utilize:**:

```bash
sudo make build
```
Ao realizar estes passos, seu ambiente estará configurado e instalado, com phpMyAdmin na porta 8888, nginx na porta 8989, e com mysql na porta 3306. 

## Comandos Disponíveis

### Construir e Iniciar Containers

```bash
sudo make build
```
- Descrição: Executa o script build.sh, inicia os containers em segundo plano e executa o script entrypoint.sh.
- Uso: Ideal para a configuração inicial do ambiente e para construir e iniciar todos os serviços necessários.

### Parar e Remover Containers

```bash
sudo make kill
```
- Descrição: Para e remove os containers e executa uma limpeza do sistema Docker.
- Uso: Use para parar e remover todos os containers e limpar o sistema.

### Iniciar Containers

```bash
sudo make start
```
- Descrição: Inicia os containers em segundo plano.
- Uso: Use para iniciar os containers que estão parados.

### Parar Containers

```bash
sudo make stop
```
- Descrição: Para todos os containers.
- Uso: Use para parar todos os containers em execução.

### Reiniciar Containers

```bash
sudo make restart
```
- Descrição: Reinicia todos os containers.
- Uso: Use para reiniciar todos os containers em execução.

### Visualizar Logs

```bash
sudo make logs
```
- Descrição: Mostra os logs dos containers em tempo real.
- Uso: Use para monitorar a saída dos logs dos containers.

### Acessar o Shell do Container 'app'

```bash
sudo make shell
```
- Descrição: Acessa o shell interativo do container app.
- Uso: Use para realizar manutenção ou diagnósticos diretamente no container app.

### Acessar o Shell do Container 'queue'

```bash
sudo make queue-shell
```
- Descrição: Acessa o shell interativo do container queue.
- Uso: Use para realizar manutenção ou diagnósticos diretamente no container queue.

### Rodar Testes

```bash
sudo make test
```
- Descrição: Executa os testes definidos no projeto Laravel.
- Uso: Use para rodar os testes automatizados da aplicação.

### Executar Migrações

```bash
sudo make migrate
```
- Descrição: Executa as migrações do banco de dados.
- Uso: Use para aplicar alterações na estrutura do banco de dados.

### Instalar Dependências

```bash
sudo make install
```
- Descrição: Instala as dependências do Composer e gera a chave da aplicação.
- Uso: Use para instalar todas as dependências e configurar a chave da aplicação.

### Atualizar Dependências

```bash
sudo make update
```
- Descrição: Atualiza as dependências do Composer.
- Uso: Use para atualizar as dependências para suas versões mais recentes.

### Limpar Volumes e Imagens Órfãs

```bash
sudo make clean
```
- Descrição: Remove volumes e imagens Docker órfãs que não estão mais em uso.
- Uso: Use para liberar espaço no disco removendo dados não utilizados.

### Derrubar Containers

```bash
sudo make down
```
- Descrição: Derruba todos os containers e redes associadas.
- Uso: Use para parar e remover os containers, mas mantendo volumes e redes persistentes.

### Subir Containers em Background

```bash
sudo make up
```
- Descrição: Inicia todos os containers em segundo plano.
- Uso: Use para subir os containers em modo detach.

### Resetar Ambiente

```bash
sudo make reset
```
- Descrição: Derruba e remove volumes e redes associadas, além de realizar uma limpeza completa.
- Uso: Use para uma limpeza completa e reinicialização do ambiente.

### Contribuição

Se você deseja contribuir para este projeto, por favor, siga estas diretrizes:

    Faça um fork do repositório.
    Crie uma nova branch para sua feature ou correção.
    Faça suas alterações e teste-as.
    Envie um pull request com uma descrição clara das mudanças.