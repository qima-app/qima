FROM webdevops/php-nginx:8.2-alpine

# RUN apt-get update -y && apt-get install -y openssl zip unzip git
RUN curl -sS https://getcomposer.org/installer | php -- --install-dir=/usr/local/bin --filename=composer
# RUN docker-php-ext-install pdo mbstring

# Copy composer.json to the desired location (e.g., /app)
COPY composer.json /app 

# Copy other files
COPY php.ini /opt/docker/etc/php/php.ini
COPY vhost.conf /opt/docker/etc/nginx/vhost.conf

# Set the working directory (if necessary)
WORKDIR /app 

RUN composer install --no-interaction --no-scripts --no-suggest

COPY . /app 

CMD php artisan serve --host=qima-website.thkzp7.easypanel.host --port=9000
