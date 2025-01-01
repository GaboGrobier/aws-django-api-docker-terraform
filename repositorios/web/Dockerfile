FROM alpine:latest
WORKDIR /repositorios/web
RUN apk add --no-cache apache2
COPY . /var/www/localhost/htdocs
EXPOSE 80
CMD ["httpd", "-D", "FOREGROUND"]
