#!/bin/bash

# Diretório compartilhado local
SHARED_DIR="/shared_directory"

# Função para fazer o upload de um arquivo para o diretório compartilhado
upload_file() {
    local file_path=$1
    cp "$file_path" "$SHARED_DIR/$(basename "$file_path")"
}

# Função para fazer o download de um arquivo do diretório compartilhado
download_file() {
    local file_name=$1
    local local_path=$2
    cp "$SHARED_DIR/$file_name" "$local_path"
}

# Exemplos de uso:
# Fazer upload de um arquivo local para o diretório compartilhado
upload_file "/shared_directory/local_file.txt"

# Fazer download
