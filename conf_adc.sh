# /bin/bash


CAMINHOSH=`find /home/ -name Conf-adc`


clear
echo "#######################################################"
echo "#     Configuração do Java da Oracle para Firefox     #"
echo "#######################################################"
sleep 2

mkdir /usr/lib/install_java
tar -zxvf $CAMINHOSH/jre-8u91-linux-i586.tar.gz -C /usr/lib/install_java

simbolicLink2="/etc/alternatives/mozilla-javaplugin"

if [ -e "$simbolicLink2" ] ; then
	rm /etc/alternatives/mozilla-javaplugin
	ln -s /usr/lib/install_java/jre1.8.0_91/lib/i386/libnpjp2.so mozilla-javaplugin

else
	ln -s /usr/lib/install_java/jre1.8.0_91/lib/i386/libnpjp2.so mozilla-javaplugin
	cd /usr/lib/mozilla/plugins
	ln -s /etc/alternatives/mozilla-javaplugin
fi
echo "Java OK"
clear



echo "#######################################################"
echo "#     Configuração do Flash da Adobe para Firefox     #"
echo "#######################################################"
sleep 2
tar -zxvf $CAMINHOSH/flash_player_npapi_linux.x86_64.tar.gz -C $CAMINHOSH
cp $CAMINHOSH/flash_player_npapi_linux.x86_64/libflashplayer.so /usr/lib/firefox-addons/plugins/
echo "- /usr/lib/firefox-addons/plugins"
echo "Flash OK"



clear
echo "#######################################################"
echo "#     Copiando o plano de fundo padrão da Cia Com     #"
echo "#######################################################"
sleep 2
mv /usr/share/backgrounds/warty-final-ubuntu.png /usr/share/backgrounds/warty-final-ubuntu.png.bkp
cp $CAMINHOSH/warty-final-ubuntu.png /usr/share/backgrounds/
echo "- /usr/share/backgrounds"
echo "Plano de fundo OK"
clear



echo "#######################################################"
echo "# Alterando configurações da tela de login do LightDM #"
echo "#######################################################"
sleep 2
echo "- /etc/lightdm/lightdm.conf" ### Mostra o arquivo que está sendo trabalhado
echo "[SeatDefaults]">>/etc/lightdm/lightdm.conf ### Configuração padrão
echo "user-session=ubuntu">>/etc/lightdm/lightdm.conf ### Sessão de logon padrão. Ubuntu.
echo "allow-guest=false">>/etc/lightdm/lightdm.conf ### Desativa o logon com convidado
echo "greeter-show-manual-login=true">>/etc/lightdm/lightdm.conf ### Mostra tela de login apenas para logon manual
echo "greeter-hide-users=true">>/etc/lightdm/lightdm.conf ### Esconde usuários locais
sleep 2
echo "Tela de login OK"
clear



echo "#######################################################"
echo "#            Instalando Navegador Chromium            #"
echo "#######################################################"
sleep 2
apt install chromium-browser -y
echo "Chromium OK"
clear



echo "#######################################################"
echo "#                   Instalando VLC                    #"
echo "#######################################################"
sleep 2
apt install vlc -y
echo "VLC OK"
clear



exit 0
