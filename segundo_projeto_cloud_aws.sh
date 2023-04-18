#! /bin/bash

INICIO=$(date +'%d/%m/%Y %r')
echo "Ínicio ${INICIO}"


echo "Atualizar o servidor"

apt-get update -y 

apt-get upgrade -y


echo "Instalar o apache2"

echo "Instalar o unzip"
apt-get install samba -y

apt-get install apache2 -y

apt install unzip -y


echo "Baixar a aplicação disponível no endereço
#https://github.com/denilsonbonatti/linux-site-dio/archive/refs/heads/main.zip no diretório /tmp"

wget -P /tmp https://github.com/denilsonbonatti/linux-site-dio/archive/refs/heads/main.zip

cd /tmp/

unzip main.zip

echo "Copiar os arquivos da aplicação no diretório padrão do apache"

cd linux-site-dio-main
cp -r * /var/www/html/

FIM=$(date +'%d/%m/%Y %r')
echo "> Script finalizado ${FIM}!"
