FROM webdevops/php-nginx:8.1-alpine

COPY dockerizer/php.ini /opt/docker/etc/php/php.ini
COPY vhost.conf /opt/docker/etc/nginx/vhost.conf
COPY composer.json composer.lock /app/
RUN composer install
COPY . /app