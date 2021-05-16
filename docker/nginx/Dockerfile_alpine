FROM nginx:1.19.10-alpine
MAINTAINER beliys "https://github.com/beliys/Anemometer"

# Install dependencies
RUN apk add --update \
		bash \
    nginx && \
    mkdir -p /etc/nginx && \
  	mkdir -p /run/nginx && \
  	mkdir -p /var/www/html && \
    rm -rf /var/cache/apk/*

# Copy config file
COPY ./docker/nginx/templates /etc/nginx/templates

# Copy web-app files
COPY ./src /var/www/html

WORKDIR /var/www/html

# Rewrite signal. Kubernetes always sends SIGTERM signal, nginx use SIGQUIT for graceful shutdown.
STOPSIGNAL SIGQUIT

CMD ["nginx", "-g", "daemon off;"]
