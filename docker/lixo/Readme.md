# Munzambi Miguel 2024


````CMD
docker build -t <nome da imagem> .
docker run -d --name <nome do container> -p 1433:1433 sqlserver2022


docker build -t ad-container .
docker run -it --name ad-container -p 53:53 -p 88:88 -p 135:135 -p 139:139 -p 138:138 -p 389:389 -p 1445:445 -p 464:464 -p 636:636 -p 3268:3268 -p 3269:3269 -d ad-container

docker images

docker run -it ad-container /bin/bash



docker build -t ad-container .
docker run -it ad-container


apt install -y software-properties-common
add-apt-repository ppa:freeipa/ppa

apt update

apt install -y freeipa-server

ipa-server-install

ipactl status
````