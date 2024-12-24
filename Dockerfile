FROM webdevops/php-nginx:8.1-alpine


# Copy files
COPY composer.json /app
COPY php.ini /opt/docker/etc/php/php.ini
COPY vhost.conf /opt/docker/etc/nginx/vhost.conf

# Install dependencies as the non-root user
RUN composer install

COPY . /app 
