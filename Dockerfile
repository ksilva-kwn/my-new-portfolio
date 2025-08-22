FROM alpine:latest

# Instala o Apache e módulos básicos
RUN apk add --no-cache apache2 apache2-utils

# Copia os arquivos da aplicação para o diretório padrão do Apache
COPY ./ /var/www/localhost/htdocs/

# Cria diretório de runtime exigido pelo Apache
RUN mkdir -p /run/apache2

# Expõe a porta 80
EXPOSE 80

# Executa o Apache em foreground
CMD ["httpd", "-D", "FOREGROUND"]