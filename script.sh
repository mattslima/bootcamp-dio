#!/bin/bash

echo "Criando diretorios"

mkdir /publico
echo "Diretorio publico criado"

mkdir /adm
echo "Diretorio adm criado"

mkdir /ven
echo "diretorio ven criado"

mkdir /sec 
echo "diretorio sec criado"


echo "Criando Grupos de Usuarios"

groupadd GRP_ADM
groupadd GRP_VEN
groupadd GRP_SEC

echo "Grupos criados com sucesso"



echo "criando usuarios"

useradd carlos -m -s /bin/bash -p $(openssl passwd -crypt ADM123) -g GRP_ADM
#usermod -g GRP_ADM carlos

useradd maria -m -s /bin/bash -p $(openssl passwd -crypt ADM123) -g GRP_ADM
#usermod -g GRP_ADM maria

useradd joao -m -s /bin/bash -p $(openssl passwd -crypt ADM123) -g GRP_ADM
#usermod -g GRP_ADM joao

echo "Usuarios do Grupo ADM criados"

useradd debora -m -s /bin/bash -p $(openssl passwd -crypt VEN123) -g GRP_VEN
#usermod -g GRP_VEN debora

useradd sebastiana -m -s /bin/bash -p $(openssl passwd -crypt VEN123) -g GRP_VEN
#usermod -g GRP_VEN sebastiana

useradd roberto -m -s /bin/bash -p $(openssl passwd -crypt VEN123) -g GRP_VEN
#usermod -g GRP_VEN roberto

echo "Usuarios do Grupo VEN criados"

useradd josefina -m -s /bin/bash -p $(openssl passwd -crypt SEC123) -g GRP_SEC
#usermod -g GRP_SEC josefina

useradd amanda -m -s /bin/bash -p $(openssl passwd -crypt SEC123) -g GRP_SEC
#usermod -g GRP_SEC amanda

useradd rogerio  -m -s /bin/bash -p $(openssl passwd -crypt SEC123) -g GRP_SEC
#usermod -g GRP_SEC rogerio

echo "usuarios do Grupo SEC criados"

echo "criando permissões as pastas"

echo "Usuario root, será dono de todas as pastas"

chown root:GRP_ADM /adm
chown root:GRP_VEN /ven
chown root:GRP_SEC /sec

echo "cada usuario acessará apenas a pasta do seu grupo + a pasta publica"

chmod 770 /adm
chmod 770 /ven
chmod 770 /sec
chmod 777 /publico

echo "script finalizado"


