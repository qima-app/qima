FROM php:8.2-apache

# Install necessary packages
RUN apt-get update && \
    apt-get install -y --no-install-recommends \
        unzip \
        libzip-dev \
        zlib1g-dev \
        libpng-dev \
        libjpeg62-turbo-dev \
        libwebp-dev \
        libxpm-dev \
        libjpeg-dev \
        libmcrypt-dev \
        libicu-dev \
        libxslt1-dev \
        imagemagick \
        ffmpeg \
        libmcrypt \
        libicu60 \
        libgd3-dev && \ 
    rm -rf /var/lib/apt/lists/*

# Install PHP GD extension
RUN docker-php-ext-install gd 

# Install composer
RUN curl -sS https://getcomposer.org/installer | php -- --install-dir=/usr/local/bin --filename=composer

# Set Composer environment variables (optional)
ENV COMPOSER_MEMORY_LIMIT=-1 
ENV COMPOSER_ALLOW_SUPERUSER=1

# Copy composer.json and composer.lock
COPY composer.json composer.lock ./

# Install project dependencies
RUN composer install --no-interaction --no-scripts --no-suggest --verbose

# Copy the entire project
COPY . .

# Expose the application port
EXPOSE 8000