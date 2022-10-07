#!/bin/bash

#CRIAR OS GRUPOS
#CRIAR OS DIRETÓRIOS
#CRIAR OS USUÁRIOS
#ADICIONAR OS USUARIOS EM SEUS RESPECTIVOS GRUPOS
#SETAR AS PERMISSÕES DAS PASTAS 

#CRIANDO ARRAYS DE USUÁRIOS, GRUPOS E DIRETÓRIOS
declare -a arraydir=("/adm" "/ven" "sec")
declare -a arrayuser=("carlos" "maria" "debora" "sebastiana" "josefina" "amanda")
declare -a arraygrupos=("GRP_ADM" "GRP_VEN" "GRP_SEC")


arraylengthdir=${#arraydir[@]}
arraylengthuser=${#arrayuser[@]}
arraylengthgrupos=${#arraygrupos[@]}

echo "Criando os Grupos"
for (( i=1; i<${arraylengthgrupos}+1; i++));
do
    groupadd ${arraygrupos[$i-1]}
done

echo "Criando os Diretórios e alterando suas permissões"
for (( i=1; i<${arraylengthdir}+1; i++));
do
    mkdir ${arraydir[$i-1]}
    chown root.${arraygrupos[$i-1]} ${arraydir[$i-1]}
    chmod 770 ${arraydir[$i-1]}
done

echo "Criando usuários"
for (( i=1; i<${arraylengthuser}+1; i++))
do
    sudo useradd -m ${arrayuser[$i-1]}
done

echo "Adicionando aos grupos"
    usermod -aG GRP_ADM carlos
    usermod -aG GRP_ADM maria
    usermod -aG GRP_VEN debora
    usermod -aG GRP_VEN sebastiana
    usermod -aG GRP_SEC josefina
    usermod -aG GRP_SEC amanda

echo "Criando pasta /public e setando permissóes para todos os usuários acessarem"
    mkdir /public
    chown 777 /public



