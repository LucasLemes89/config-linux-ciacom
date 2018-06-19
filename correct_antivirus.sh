#/bin/bash
clear

echo "Vamos tentar corrigir o problema da instalação do agente kaspersky..."
sleep 2

	dpkg --purge klnagent
	apt-get install libc6-i386
	/etc/init.d/apparmor stop
	sleep 1
	apt-get remove apparmor
	sleep 3
	clear

echo "Agora reinicie o computador e tente instalar novamente o antivirus!"
sleep 5

exit 0
