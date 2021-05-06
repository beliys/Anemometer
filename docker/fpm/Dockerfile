FROM php:8.0.5-fpm-alpine
MAINTAINER beliys "https://github.com/beliys/Anemometer"

ARG PHP_EXTENSIONS="mysqli bcmath opcache"

# Install dependencies
RUN apk add --update \
		bash && \
    docker-php-ext-install $PHP_EXTENSIONS && \
    docker-php-source delete && \
    rm -rf /var/cache/apk/*

# Use the production configuration
RUN mv "$PHP_INI_DIR/php.ini-production" "$PHP_INI_DIR/php.ini"

# copy php configs
COPY ./docker/fpm/modules /usr/local/etc/php/conf.d

# Copy web-app files
COPY ./src /var/www/html
COPY ./docker/fpm/conf /var/www/html/conf

WORKDIR /var/www/html

# Rewrite signal. Kubernetes always sends SIGTERM signal, fpm use SIGQUIT for graceful shutdown.
STOPSIGNAL SIGQUIT

CMD ["php-fpm"]
