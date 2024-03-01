# Use uma imagem base com Samba
FROM dperson/samba:latest

# Defina as variáveis de ambiente para o Samba
ENV USER=myuser
ENV PASSWORD=mypassword
ENV VOLUME_NAME=myvolume
ENV VOLUME_PATH=/shared_directory

# Crie o diretório compartilhado
RUN mkdir $VOLUME_PATH

# Adicione permissões ao diretório
RUN chown $USER:$USER $VOLUME_PATH

# Adicione a configuração do compartilhamento ao Samba
RUN echo "[$VOLUME_NAME]\n\
    path = $VOLUME_PATH\n\
    read only = no" >>/etc/samba/smb.conf

# Defina o comando padrão que será executado ao iniciar o contêiner
CMD ["smbd", "--foreground", "--log-stdout"]
