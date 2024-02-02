FROM ubuntu:latest

RUN apt-get update 

RUN apt-get upgrade -y 

RUN apt-get install -y samba


RUN echo "DOMAIN=ntemo.dev" >> /etc/default/winbindd
RUN echo "workgroup = NTEMO" >> /etc/samba/smb.conf
RUN echo "security = ads" >> /etc/samba/smb.conf
RUN echo "realm = NTEMO" >> /etc/samba/smb.conf
RUN echo "password server = Angola2024!" >> /etc/samba/smb.conf
RUN echo "idmap config * : backend = tdb" >> /etc/samba/smb.conf

RUN echo "winbind use default domain = true" >> /etc/samba/smb.conf
RUN echo "winbind offline logon = false" >> /etc/samba/smb.conf
RUN echo "winbind enum users = yes" >> /etc/samba/smb.conf
RUN echo "winbind enum groups = yes" >> /etc/samba/smb.conf

RUN service smbd restart
RUN service nmbd restart
RUN service winbind restart


RUN apt-get install -y krb5-user

COPY krb5.conf /etc/krb5.conf
RUN echo "NTEMO" > /etc/krb5.conf

