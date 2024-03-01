# Use a imagem oficial do Ubuntu
FROM ubuntu:latest

# Atualize o sistema e instale o Samba
RUN apt-get update && apt-get install -y samba

# Crie o diretório que você deseja compartilhar
RUN mkdir /workdir

# Dê a todos os usuários acesso de leitura/escrita ao diretório
RUN chmod -R 777 /workdir

# Crie o arquivo de configuração do Samba
RUN echo -e "[global]\nworkgroup = WORKGROUP\nsecurity = user\nmap to guest = Bad User\n\n[workdir]\npath = /workdir\nbrowsable =yes\nwritable = yes\nguest ok = yes\nread only = no" > /etc/samba/smb.conf

# Exponha a porta do Samba
EXPOSE 137/udp 138/udp 139 445

# Inicie o serviço Samba quando o contêiner for iniciado
CMD service smbd start && bash
