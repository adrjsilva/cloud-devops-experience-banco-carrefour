#!/bin/bash

echo "Atualizando Repositório Linux & Atualizando pacotes"
apt-get update -y && apt-get upgrade -y

echo "Instalando Servidor Apache"
apt-get install -y apache2

echo "Instalando Unzip"
apt-get install -y unzip

echo "Baixando Aplicação no Repositório "
cd /tmp
wget https://github.com/denilsonbonatti/linux-site-dio/archive/refs/heads/main.zip 
unzip main.zip

echo "Copiando APP para o diretório padrão do Apache"
cp -r /tmp/main/* /var/www/html/



