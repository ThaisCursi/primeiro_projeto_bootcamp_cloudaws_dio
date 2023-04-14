#!/bin/bash

INICIO=$(date +'%d/%m/%Y %r')


echo "Ínicio ${INICIO}"


echo "> Criando diretórios"

if test -d "/publico/" ;
	then
		echo "Diretorios ja existem."
	else
		mkdir /publico
		echo "Diretorio publico criado."
fi
if test -d "/adm/";
	then
		echo "Diretorios ja existem."
	else
		mkdir /adm
		echo "Diretorio adm criado."
fi

if test -d "/ven/";
	then
		echo "Diretorios ja existem."
	else
		mkdir /ven
		echo "Diretorio ven criado."
fi

if test -d "/sec/";
	then
		echo "Diretorios ja existem."
	else
		mkdir /sec
		echo "Diretorio sec criado."
fi

echo ">> Diretórios criados"

echo "> Criando grupos de acesso"

groupadd GRP_ADM
groupadd GRP_VEN
groupadd GRP_SEC
echo ">> Grupos de acesso criados"

echo "> Criando usuários"
sudo useradd carlos -c "Carlos" -s /bin/bash -m -p $(openssl passwd -1 teste1) -G GRP_ADM
sudo useradd maria -c "Maria" -s /bin/bash -m -p $(openssl passwd -1 teste1) -G GRP_ADM
sudo useradd joao -c "Joao" -s /bin/bash -m -p $(openssl passwd -1 teste1) -G GRP_ADM

sudo useradd debora  -c "Debora" -s /bin/bash -m  -p $(openssl passwd -1 teste1) -G GRP_VEN
sudo useradd sebastiana  -c "Sebastiana" -s /bin/bash  -m -p $(openssl passwd -1 teste1)  -G GRP_VEN
sudo useradd roberto -c "Roberto" -s /bin/bash  -m -p $(openssl passwd -1 teste1) -G GRP_VEN

sudo useradd josefina -c "Josefina" -s /bin/bash -m -p $(openssl passwd -1 teste1) -G GRP_SEC
sudo useradd amanda  -c "Amanda" -s /bin/bash -m  -p $(openssl passwd -1 teste1) -G GRP_SEC
sudo useradd rogerio   -c "Rogerio" -s /bin/bash  -m -p $(openssl passwd -1 teste1) -G GRP_SEC

echo ">> Usuarios criados"

echo "> Alterando permissões dos diretórios"
chown root:GRP_ADM /adm
chown root:GRP_VEN /ven
chown root:GRP_SEC /sec

chmod 770  /adm 
chmod 770  /ven  
chmod 770  /sec 
chmod 777 /publico

echo ">> Permissões dos diretórios alteradas."


FIM=$(date +'%d/%m/%Y %r')
echo "> Script finalizado ${FIM}!"
