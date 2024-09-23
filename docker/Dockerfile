FROM php:8.2-fpm

ARG user=admin
ARG uid=1000

RUN apt-get update && apt-get install -y \
    git \
    curl \
    libpng-dev \
    libonig-dev \
    libpq-dev \
    iputils-ping \
    zip \
    unzip

RUN apt-get clean && rm -rf /var/lib/apt/lists/*

RUN docker-php-ext-install pdo pdo_mysql mbstring exif pcntl bcmath gd sockets

COPY --from=composer:latest /usr/bin/composer /usr/bin/composer

RUN useradd -G www-data,root -u $uid -d /home/$user $user
RUN mkdir -p /home/$user/.composer && \
    chown -R $user:$user /home/$user

RUN pecl install -o -f redis \
    &&  rm -rf /tmp/pear \
    &&  docker-php-ext-enable redis

WORKDIR /var/www

RUN chmod -R 777 /var/www

# Copiar o entrypoint para o container
COPY ./docker/entrypoint.sh /usr/local/bin/entrypoint.sh

# Dar permissão de execução ao entrypoint
RUN chmod +x /usr/local/bin/entrypoint.sh

# Definir o entrypoint do container
ENTRYPOINT ["/usr/local/bin/entrypoint.sh"]

# Comando padrão, o php-fpm
CMD ["php-fpm"]
