# Use a imagem base do Ubuntu 22.04 LTS
FROM ubuntu:22.04

# Instale as dependências necessárias
RUN apt-get update && \
    apt-get install -y \
    bash \
    && rm -rf /var/lib/apt/lists/*

# Crie o diretório compartilhado
RUN mkdir /shared_directory

# Copie os scripts de manipulação de arquivos para o contêiner
COPY file_operations.sh /usr/local/bin/file_operations.sh

# Dê permissões de execução aos scripts
RUN chmod +x /usr/local/bin/file_operations.sh

# Defina o diretório de trabalho padrão
WORKDIR /shared_directory

# Exponha a porta 8080 para possível uso futuro (ajuste conforme necessário)
EXPOSE 8080

# Defina o comando padrão que será executado ao iniciar o contêiner
CMD ["bash"]
