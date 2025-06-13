FROM php:8.1-cli

# Definir o diretório de trabalho dentro do container
WORKDIR /var/www/html

# Instalar dependências do sistema, PHP e o Composer
RUN apt-get update && apt-get install -y git unzip \
    && curl -sS https://getcomposer.org/installer | php -- --install-dir=/usr/local/bin --filename=composer

# Instalar extensões PHP necessárias (incluindo pdo_mysql para conexão com MySQL)
RUN docker-php-ext-install pdo pdo_mysql

# Copiar o arquivo composer.json e composer.lock 
COPY composer.json composer.lock ./

# Instalar dependências do Composer
RUN composer install --no-scripts --prefer-dist

# Copiar o restante do código para o container
COPY . .

# Definir o comando padrão para rodar o servidor PHP
CMD ["php", "-S", "0.0.0.0:8000", "-t", "/var/www/html/public"]
