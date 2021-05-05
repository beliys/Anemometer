FROM php:8.0.5-fpm-alpine
MAINTAINER beliys "https://github.com/beliys/Anemometer"

ARG PHP_EXTENSIONS="mysqli bcmath opcache"

# Install dependencies
RUN apk add --update \
		bash && \
    docker-php-ext-install $PHP_EXTENSIONS && \
    docker-php-source delete && \
    rm -rf /var/cache/apk/*

# Copy web-app files
COPY ./src /var/www/html
COPY ./docker/fpm/conf /var/www/html/conf

WORKDIR /var/www/html

# Rewrite signal. Kubernetes always sends SIGTERM signal, fpm use SIGQUIT for graceful shutdown.
# https://github.com/php/php-src/blob/6053987bc27e8dede37f437193a5cad448f99bce/sapi/fpm/fpm/fpm_events.c#L91
# ENTRYPOINT ["dumb-init", "--rewrite", "15:3", "docker-php-entrypoint"]

STOPSIGNAL SIGQUIT

CMD ["php-fpm"]
