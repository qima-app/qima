FROM webdevops/php-nginx:8.2-alpine

# Copy composer.json to the desired location (e.g., /app)
COPY composer.json /app 

# Copy other files
COPY php.ini /opt/docker/etc/php/php.ini
COPY vhost.conf /opt/docker/etc/nginx/vhost.conf

# Set the working directory (if necessary)
WORKDIR /app 

RUN composer install --no-interaction --no-scripts --no-suggest

COPY . /app 