# Use a imagem oficial do SQL Server 2022
FROM mcr.microsoft.com/mssql/server:2022-latest

# Configurações do SQL Server
ENV SA_PASSWORD=Angola2022 \
    ACCEPT_EULA=Y \
    MSSQL_PID=Developer

# Expor a porta padrão do SQL Server
EXPOSE 1433

# Diretório de trabalho
WORKDIR /usr/src/app

# Copie o script SQL para o contêiner
COPY setup.sql .

# Comando de inicialização
# CMD /opt/mssql/bin/sqlservr & /opt/mssql-tools/bin/sqlcmd -S localhost -U SA -P Angola2022 -d master -i /usr/src/app/setup.sql

# Comando para iniciar o SQL Server
RUN /opt/mssql/bin/sqlservr & sleep 20s && /opt/mssql-tools/bin/sqlcmd -S localhost -U SA -P Angola2022 -d master -i /usr/src/app/setup.sql

# Comando padrão do contêiner (não precisa do &)
CMD [ "/opt/mssql/bin/sqlservr" ]
