# /bin/bash

##################################################
#                                                #
#         Script de configuração SAMBA 4         #
#                 14 Cia Com Mec                 #
#      Autor: Lucas da Silva Lemes - 3º Sgt      #
#          email: lemes.lucas@eb.mil.br          #
#                                                #
##################################################
#variaveis globais:
HOSTNAME=rondon1
MEUIP=`hostname -I`
CAMINHOSH=`find /home/ -name samba4`

clear
echo "Bem vindo a configuração de login da 14ª cia com mec!"
sleep 2
clear

echo "Configurando para ingressar no domínio da cia com..."
sleep 2
clear

echo "      Digite o nome do host(ex: secti-sd-bonari ):      "
echo "Comprimento máximo para nome do host é de 15 caracteres."
read HOSTNAME; #armazena o nome do host na variavel HOSTNAME, substituindo o valor rondon1
clear

echo "O hostname escolhido eh: $HOSTNAME"
sleep 3
clear

echo "IP que o host irá utilizar:$MEUIP"
sleep 3
clear

apt install samba krb5-user winbind smbclient libnss-winbind libpam-winbind ntp -y

mv /etc/samba/smb.conf /etc/samba/smb.conf.old
rm /var/run/samba/*.tdb
rm /var/lib/samba/*.tdb
rm /var/cache/samba/*.tdb
cat $CAMINHOSH/smb.conf > /etc/samba/smb.conf #cria um novo smb.conf
sed -i s/teste1/$HOSTNAME/ /etc/samba/smb.conf #substitui o netbios-name pelo valor da variavel HOSTNAME

echo '!root = LAB\Administrator' >/etc/samba/user.map

cat $CAMINHOSH/krb5.conf > /etc/krb5.conf #substitui o conteúdo do krb5.conf

cat $CAMINHOSH/nsswitch.conf > /etc/nsswitch.conf #substitui o conteúdo do nsswitch.conf

cat $CAMINHOSH/hosts > /etc/hosts #substitui o conteúdo do /etc/hosts
sed -i s/teste1/$HOSTNAME/g /etc/hosts #substitui a ER pelo valor armazenado na variavel
sed -i s/10.56.208.28/$MEUIP/g /etc/hosts #substitui a ER pelo valor armazenado na variavel

echo "session required pam_mkhomedir.so skel=/etc/skel/ umask=0022" >> /etc/pam.d/common-account


cat $CAMINHOSH/ntp.conf > /etc/ntp.conf
echo "- /etc/ntp.conf" ### Mostra o arquivo que está sendo trabalhado
echo "Verifique se a hora esta correta:"
/etc/init.d/ntp restart
sleep 2
ntpq -p
sleep 3
clear



echo "Quase tudo pronto, agora ingresse a máquina no AD da cia utilizando a senha do Administrador do AD"
sleep 2
net ads join -U administrator
sleep 2
net ads info
sleep 4
clear



echo "Muito bem, a maquina agora ja faz parte do Active Directory. Agora iremos configurar os compartilhamentos..."
echo "Serão instalados alguns pacotes..."
sleep 3
apt install cifs-utils libpam-mount -y
cat $CAMINHOSH/pam_mount.conf.xml > /etc/security/pam_mount.conf.xml
clear


echo "Pronto! Se tudo correu bem, a configuração está finalizada! :)"
sleep 3


exit 0
