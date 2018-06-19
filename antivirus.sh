# /bin/bash

clear

echo "##################################################"
echo "#                                                #"
echo "#  Instalando antivirus corporativo (Kaspersky)  #"
echo "#                                                #"
echo "##################################################"
sleep 2
clear

CAMINHOSH=`find /home/ -name antivirus`
cd $CAMINHOSH

echo "O pacote libc6-i386 deve ser instalado em versões Ubuntu de 64 bits antes da instalação do Kaspersky Anti-Virus."
sleep 4
apt install libc6-i386 -y
clear


Servidor=10.56.84.25
deb_architecture='i386'

if [ "$(uname -m)" = "x86_64" ]; then
	deb_architecture='amd64'
	if [ -e klnagent_10.1.1-26_i386.deb ]; then
		dpkg -i --force-architecture klnagent_10.1.1-26_i386.deb
	else
		echo "ERRO-O arquivo klnagent_10.1.1-26_i386.deb de instalacao nao escontra-se no mesmo diretorio deste script, favor colocar junto e reiniciar a instalacao"
		sleep 2
		exit 1
	fi
else
	if [ -e klnagent_10.1.1-26_i386.deb ]; then
		dpkg -i klnagent_10.1.1-26_i386.deb
	else
		echo "ERRO-O arquivo klnagent_10.1.1-26_i386.deb de instalacao nao escontra-se no mesmo diretorio deste script, favor colocar junto e reiniciar a instalacao"
		sleep 2
		exit 1
	fi
fi


### Gerar arquivo com as entradas ###
	echo "$Servidor" > entrada.txt
	echo "14000" >> entrada.txt
	echo "13000" >> entrada.txt
	echo "Y" >> entrada.txt
	echo "1" >> entrada.txt


### Configurar o agente ###
	if [ -e /opt/kaspersky/klnagent/lib/bin/setup/postinstall.pl ]; then
		/opt/kaspersky/klnagent/lib/bin/setup/postinstall.pl < entrada.txt
	else
		echo "ERRO-Houve algum erro na ainstalacao do agente de rede, verifique os arquivos de log"
		sleep 2
		exit 1
	fi


### Verificar estado do agente ###
	sleep 4
	if [ -e /opt/kaspersky/klnagent/bin/klnagchk ]; then
		/opt/kaspersky/klnagent/bin/klnagchk	
		echo "Instalação do Agente do antivírus ok"
	else
		echo "Houve um erro na instalação do Agente do Antivirus, use a opção de correção no script principal"
		sleep 2
		exit 1
	fi


### Instalar o Endpoint ###
	if [ -e kesl_10.0.0-3458_$deb_architecture.deb ]; then
		dpkg -i kesl_10.0.0-3458_$deb_architecture.deb
	else
		echo "ERRO-O arquivo kesl_10.0.0-3458_$deb_architecture.deb de instalacao nao escontra-se no mesmo diretorio deste script, favor colocar junto e reiniciar a instalacao"
		sleep 2
	fi


### Gerar arquivo com as entradas ###
idioma=`locale -a | grep pt_BR.utf8`
echo "EULA_AGREED=yes" > entrada.txt
echo "USE_KSN=no" >> entrada.txt

	if [ "$idioma" = "pt_BR.utf8" ]; then
		echo "SERVICE_LOCALE=$idioma" >> entrada.txt
	else
		echo "SERVICE_LOCALE=en_US.utf8" >> entrada.txt
	fi
		echo "INSTALL_LICENSE=" >> entrada.txt
		echo "UPDATER_SOURCE=SCServer" >> entrada.txt
		echo "PROXY_SERVER=none" >> entrada.txt
		echo "UPDATE_EXECUTE=yes" >> entrada.txt
		echo "KERNEL_SRCS_INSTALL=yes" >> entrada.txt

### Configurar o endpoint ###
	if [ -e /opt/kaspersky/kesl/bin/kesl-setup.pl ]; then
		/opt/kaspersky/kesl/bin/kesl-setup.pl --autoinstall=entrada.txt
	else
		echo "ERRO-Houve algum erro na ainstalacao do endpoint, verifique os arquivos de log"
		sleep 2
		exit 1
	fi


### Verificar o estado do endpoint ###
	sleep 4
	/opt/kaspersky/klnagent/bin/klnagchk -restart
	/etc/init.d/kesl-supervisor restart
	/opt/kaspersky/kesl/bin/kesl-control -S
	sleep 4
	rm entrada.txt

echo "Instalacao do Antivirus Finalizada"
sleep 4
clear

exit 0
