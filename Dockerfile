FROM webdevops/php-nginx:8.1-alpine

COPY composer.json /app
COPY php.ini /opt/docker/etc/php/php.ini
COPY vhost.conf /opt/docker/etc/nginx/vhost.conf
RUN composer install
COPY . /app


