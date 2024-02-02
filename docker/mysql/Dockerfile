# Use a imagem oficial do MySQL
FROM mysql:latest

# Defina variáveis de ambiente para a configuração do MySQL
ENV MYSQL_ROOT_PASSWORD=root \
    MYSQL_DATABASE=demo \
    MYSQL_USER=root \
    MYSQL_PASSWORD=root

# Exponha a porta padrão do MySQL
EXPOSE 3306

# Copie scripts SQL ou outros arquivos necessários (opcional)
COPY setup.sql /docker-entrypoint-initdb.d/

CMD ["mysqld"]
