FROM openresty/openresty:1.25.3.2-0-alpine-fat

# Install necessary dependencies
RUN apk add --no-cache --virtual .build-deps \
    openssl && \
    luarocks install lua-resty-auto-ssl && \
    openssl req -new -newkey rsa:2048 -days 3650 -nodes -x509 \
    -subj '/CN=sni-support-required-for-valid-ssl' \
    -keyout /etc/ssl/resty-auto-ssl-fallback.key \
    -out /etc/ssl/resty-auto-ssl-fallback.crt 

# Create directory for auto-ssl
RUN mkdir -p /etc/resty-auto-ssl && \
    chown -R nobody:nogroup /etc/resty-auto-ssl

# Copy OpenResty configuration file
COPY nginx.conf /usr/local/openresty/nginx/conf/nginx.conf

# Expose HTTP and HTTPS ports
EXPOSE 80 443

CMD ["openresty", "-g", "daemon off;"]