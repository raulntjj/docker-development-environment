# Projeto Docker

Este projeto utiliza Docker para simplificar o gerenciamento de containers e serviços. Este `README` fornece instruções sobre como usar os comandos disponíveis e os pré-requisitos necessários para executar o projeto.

## Pré-requisitos

Antes de começar, certifique-se de ter os seguintes pré-requisitos instalados em sua máquina:

- **Docker**: Ferramenta de containerização. [Instalação do Docker](https://docs.docker.com/get-docker/)
- **Docker Compose**: Ferramenta para definir e executar aplicativos Docker multi-containers. [Instalação do Docker Compose](https://docs.docker.com/compose/install/)

## Configuração Inicial

1. **Clone o repositório**:

```bash
git clone <URL_DO_REPOSITORIO>
cd <NOME_DO_REPOSITORIO>
```

2. **Certifique-se de que o arquivo `build.sh` esteja executável**:

```bash
chmod +x build.sh
```

3. **Crie o arquivo `.env`**:

    Se o arquivo `.env` não existir, copie o arquivo de exemplo para criar um:

```bash
cp .env.example .env
```

## Comandos Disponíveis

### Construir e Iniciar Containers

```bash
make build
```
    Descrição: Executa o script build.sh, inicia os containers em segundo plano e executa o script entrypoint.sh.
    Uso: Ideal para a configuração inicial do ambiente e para construir e iniciar todos os serviços necessários.

### Parar e Remover Containers

```bash
make kill
```
    Descrição: Para e remove os containers e executa uma limpeza do sistema Docker.
    Uso: Use para parar e remover todos os containers e limpar o sistema.

### Iniciar Containers

```bash
make start
```
    Descrição: Inicia os containers em segundo plano.
    Uso: Use para iniciar os containers que estão parados.

### Parar Containers

```bash
make stop
```
    Descrição: Para todos os containers.
    Uso: Use para parar todos os containers em execução.

### Reiniciar Containers

```bash
make restart
```
    Descrição: Reinicia todos os containers.
    Uso: Use para reiniciar todos os containers em execução.

### Visualizar Logs

```bash
make logs
```
    Descrição: Mostra os logs dos containers em tempo real.
    Uso: Use para monitorar a saída dos logs dos containers.

### Acessar o Shell do Container 'app'

```bash
make shell
```
    Descrição: Acessa o shell interativo do container app.
    Uso: Use para realizar manutenção ou diagnósticos diretamente no container app.

### Acessar o Shell do Container 'queue'

```bash
make queue-shell
```
    Descrição: Acessa o shell interativo do container queue.
    Uso: Use para realizar manutenção ou diagnósticos diretamente no container queue.

### Rodar Testes

```bash
make test
```
    Descrição: Executa os testes definidos no projeto Laravel.
    Uso: Use para rodar os testes automatizados da aplicação.

### Executar Migrações

```bash
make migrate
```
    Descrição: Executa as migrações do banco de dados.
    Uso: Use para aplicar alterações na estrutura do banco de dados.

### Instalar Dependências

```bash
make install
```
    Descrição: Instala as dependências do Composer e gera a chave da aplicação.
    Uso: Use para instalar todas as dependências e configurar a chave da aplicação.

### Atualizar Dependências

```bash
make update
```
    Descrição: Atualiza as dependências do Composer.
    Uso: Use para atualizar as dependências para suas versões mais recentes.

### Limpar Volumes e Imagens Órfãs

```bash
make clean
```
    Descrição: Remove volumes e imagens Docker órfãs que não estão mais em uso.
    Uso: Use para liberar espaço no disco removendo dados não utilizados.

### Derrubar Containers

```bash
make down
```
    Descrição: Derruba todos os containers e redes associadas.
    Uso: Use para parar e remover os containers, mas mantendo volumes e redes persistentes.

### Subir Containers em Background

    ```bash
    make up
    ```
    Descrição: Inicia todos os containers em segundo plano.
    Uso: Use para subir os containers em modo detach.

### Resetar Ambiente

    ```bash
    make reset
    ```
    Descrição: Derruba e remove volumes e redes associadas, além de realizar uma limpeza completa.
    Uso: Use para uma limpeza completa e reinicialização do ambiente.

### Contribuição

Se você deseja contribuir para este projeto, por favor, siga estas diretrizes:

    Faça um fork do repositório.
    Crie uma nova branch para sua feature ou correção.
    Faça suas alterações e teste-as.
    Envie um pull request com uma descrição clara das mudanças.