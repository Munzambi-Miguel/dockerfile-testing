#!/bin/bash

# Configurações iniciais do Samba e Kerberos
echo "ntemo.dev" >/etc/samba/smb.conf
echo "ntemo.dev" >/etc/krb5.conf

# Criação do diretório do banco de dados do Samba
mkdir -p /var/lib/samba/private

# Adicione este comando após reiniciar os serviços no setup.sh
samba-tool dbcheck --fix

# Reinicia os serviços para aplicar as configurações
service samba restart -d3
service smbd restart -d3
service nmbd restart -d3
service winbind restart -d3

# Adiciona o usuário laravel.admin
samba-tool user create laravel.admin Angola2023! --userou="cn=Users,dc=ntemo,dc=dev" --given-name=Laravel --surname=Admin --description="Admin User for Laravel"

# Adiciona o usuário administrador ao grupo de administradores
usermod -aG sudo laravel.admin

# Reinicia os serviços novamente após a criação do usuário
service samba restart -d3
service smbd restart -d3
service nmbd restart -d3
service winbind restart -d3

mkdir -p /var/log/samba
chown -R root:adm /var/log/samba
sed -i 's/log file =/log file = \/var\/log\/samba\/log.smbd /g' /etc/samba/smb.conf
