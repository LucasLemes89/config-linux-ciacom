# /bin/bash

clear ### Limpa a tela

echo "---------------------------------------------------------"
echo "-                                                       -"
echo "-    [1] Atualizar no repositório da 14ª Cia Com Mec    -"
echo "-    [2] Diretamente na internet                        -"      ### Menu de escolha para tipos de atualização
echo "-    [3] Voltar ao script inicial                       -"
echo "-                                                       -"
echo "---------------------------------------------------------"
echo "-                                                       -"
echo "-            Responda com o número da opção             -"
echo "-                                                       -"
echo "---------------------------------------------------------"

read resposta1 ### Lê o número digitado e armazena na variável resposta

case "$resposta1" in ### Inicio do controle de fluxo case, baseado no valor da viariável resposta1

1) ### Primeiro caso
	
	clear
	echo "Para atualizar essa máquina, forneça um usuário com acesso administrador."
	echo "Digite o nome de usuário:"
	read user
	echo "Digite a senha:"
	read -s pass

	export http_proxy=http://"$user":"$pass"@10.56.208.15:3128
	export https_proxy=https://"$user":"$pass"@10.56.208.15:3128

	clear ### Limpa a tela

	echo "--------------------------------------------"
	echo "-                                          -"
	echo "- [1] Debian                               -" ### Exibe o menu sobre as versões de Linux disponíveis
	echo "- [2] Ubuntu                               -"
	echo "-                                          -"
	echo "--------------------------------------------"

	read resposta2 ### Lê o número digitado e armazena na variável resposta

	case "$resposta2" in ### Início do controle de fluxo case, baseado no valor da variável resposta2

		1) ### Primeiro caso

		clear ### Limpa a tela

		echo "-------------------------------------------"
		echo "-                                         -"
		echo "-    As versões disponíveis são:          -"
		echo "-                                         -"
		echo "-------------------------------------------"
		echo "-                                         -"
		echo "- [1] Linux Debian 8.0 (Jessie)           -"
		echo "- [2] Linux Debian 7.0 (Wheezy)           -" ### Exibe o menu sobre as versões do repositório disponíveis para Debian
		echo "- [3] Linux Debian 6.0 (Squeeze)          -"
		echo "- [4] Linux Debian 5.0 (Lenny)            -"
		echo "-                                         -"
		echo "-------------------------------------------"
		echo "-                                         -"
		echo "-    Responda com o número da opção:      -"
		echo "-                                         -"
		echo "-------------------------------------------"

		read escolha ### Lê a resposta inserida pelo teclado e armazena na variável escolha
		;; ### Break
		2) ### Segundo caso

		clear ### Limpa a tela

		echo "---------------------------------------------"
		echo "-                                           -"
		echo "-    As versões disponíveis são:            -"
		echo "-                                           -"
		echo "---------------------------------------------"
		echo "-                                           -"
		echo "- [1] Linux Ubuntu 16.04 (Xenial Xerus)     -"
		echo "- [2] Linux Ubuntu 14.04 (Trusty Tahr)      -" ### Exibe o menu sobre as versões do repositório disponíveis para Ubuntu
		echo "- [3] Linux Ubuntu 12.04 (Precise Pangolin) -"
		echo "- [4] Linux Ubuntu 8.10  (Intrepid Ibex)    -"
		echo "-                                           -"
		echo "---------------------------------------------"
		echo "-                                           -"
		echo "-    Responda com o número da opção:        -"
		echo "-                                           -"
		echo "---------------------------------------------"

		read escolha ### Lê a resposta inserida pelo teclado e armazena na variável escolha
		;; ### Break
		*) ### Caso default

		clear ### Limpa a tela

		echo "--------------------------------"
		echo "-                              -"
		echo "-      Parâmetro inválido!     -" ### Exibe um aviso com errro
		echo "-                              -"
		echo "--------------------------------"		

	esac ### Fim do controle de fluxo case

;; ### Break
2) ### Segundo caso
	
	clear
	echo "Para atualizar essa máquina, forneça um usuário com acesso administrador."
	echo "Digite o nome de usuário:"
	read user
	echo "Digite a senha:"
	read -s pass

	export http_proxy=http://"$user":"$pass"@10.56.208.15:3128
	export https_proxy=https://"$user":"$pass"@10.56.208.15:3128

	if [ -e /etc/apt/sources.list.orig ]; then
		cp /etc/apt/sources.list /etc/apt/sources.list.bkp ### Copia a sources.list para um novo nome
		mv sources.list.orig sources.list
		egrep -v '^#|^ *$' /etc/apt/sources.list
		apt-get update
		apt upgrade -y
		clear
		echo "Atualização finalizada!"
		sleep 2
		exit 0
	else
		egrep -v '^#|^ *$' /etc/apt/sources.list
		apt-get update
		apt upgrade -y
		clear
		echo "Atualização finalizada!"
		sleep 2
		exit 0
	fi
;; ### Break
3) ### Terceiro caso
	
	CAMINHOSH=`find /home/ -type f -name config_linux.sh`	
    mainframe

;; ### Break
*) ### Caso default

	clear ### Limpa a tela

echo "--------------------------------"
echo "-                              -"
echo "-      Parâmetro inválido!     -" ### Exibe um aviso com errro
echo "-                              -"
echo "--------------------------------"

	exit 0
esac ### Fim do controle de fluxo case

if [ $resposta2 -eq 1 ]
then

	if [ $escolha -eq 1 ]; then ### Inicio do controle de fluxo if para verificar valor da variável escolha1
	### Se for igual a 1 instala a sources.list do repositório para Debian 8.0
	### Linux Debian 8.0

		if [ -e /etc/apt/sources.list.orig ]; then
			cp /etc/apt/sources.list /etc/apt/sources.list.bkp ### Copia a sources.list para um novo nome

			### Indica as pastas de pacotes principais, "não-livres" e livres (com licença copyright) no servidor
			echo "deb http://10.56.208.18/debian jessie main non-free contrib " > /etc/apt/sources.list
			### Indica as pastas de pacotes principais, "não-livres" e livres (com licença copyright), atualizados
			echo "deb http://10.56.208.18/debian jessie-updates main contrib non-free" >> /etc/apt/sources.list
			### Indica as pastas de pacotes principais, "não-livres" e livres (com licença copyright), novos programas
			echo "deb http://10.56.208.18/debian jessie-backports main contrib non-free" >> /etc/apt/sources.list
			### Indica as pastas de pacotes principais, "não-livres" e livres (com licença copyright), com atualizações de segurança
			echo "deb http://10.56.208.18/debian-security/ jessie/updates main contrib non-free" >> /etc/apt/sources.list

			clear
			egrep -v '^#|^ *$' /etc/apt/sources.list
			apt-get update
			apt upgrade -y
			clear
			echo "Atualização finalizada!"
			sleep 2
			exit 0

		else
			cp /etc/apt/sources.list /etc/apt/sources.list.orig ### Copia a sources.list para um novo nome

			### Indica as pastas de pacotes principais, "não-livres" e livres (com licença copyright) no servidor
			echo "deb http://10.56.208.18/debian jessie main non-free contrib " > /etc/apt/sources.list
			### Indica as pastas de pacotes principais, "não-livres" e livres (com licença copyright), atualizados
			echo "deb http://10.56.208.18/debian jessie-updates main contrib non-free" >> /etc/apt/sources.list
			### Indica as pastas de pacotes principais, "não-livres" e livres (com licença copyright), novos programas
			echo "deb http://10.56.208.18/debian jessie-backports main contrib non-free" >> /etc/apt/sources.list
			### Indica as pastas de pacotes principais, "não-livres" e livres (com licença copyright), com atualizações de segurança
			echo "deb http://10.56.208.18/debian-security/ jessie/updates main contrib non-free" >> /etc/apt/sources.list

			clear
			egrep -v '^#|^ *$' /etc/apt/sources.list
			apt-get update
			apt upgrade -y
			clear
			echo "Atualização finalizada!"
			sleep 2
			exit 0
		fi

	elif [ $escolha -eq 2 ]; then
	### Se for igual a 2 instala a sources.list do repositório para Debian 7.0
	### Linux Debian 7.0

		if [ -e /etc/apt/sources.list.orig ]; then
			cp /etc/apt/sources.list /etc/apt/sources.list.bkp ### Copia a sources.list para um novo nome

			### Indica as pastas de pacotes principais, "não-livres" e livres (com licença copyright) no servidor
			echo "deb http://10.56.208.18/debian wheezy main non-free contrib " > /etc/apt/sources.list
			### Indica as pastas de pacotes principais, "não-livres" e livres (com licença copyright), atualizados
			echo "deb http://10.56.208.18/debian wheezy-updates main contrib non-free" >> /etc/apt/sources.list
			### Indica as pastas de pacotes principais, "não-livres" e livres (com licença copyright), novos programas
			echo "deb http://10.56.208.18/debian wheezy-backports main contrib non-free" >> /etc/apt/sources.list
			### Indica as pastas de pacotes principais, "não-livres" e livres (com licença copyright), com atualizações de segurança
			echo "deb http://10.56.208.18/debian-security/ wheezy/updates main contrib non-free" >> /etc/apt/sources.list

			clear
			egrep -v '^#|^ *$' /etc/apt/sources.list
			apt-get update
			apt upgrade -y
			clear
			echo "Atualização finalizada!"
			sleep 2
			exit 0

		else
			cp /etc/apt/sources.list /etc/apt/sources.list.orig ### Copia a sources.list para um novo nome

			### Indica as pastas de pacotes principais, "não-livres" e livres (com licença copyright) no servidor
			echo "deb http://10.56.208.18/debian wheezy main non-free contrib " > /etc/apt/sources.list
			### Indica as pastas de pacotes principais, "não-livres" e livres (com licença copyright), atualizados
			echo "deb http://10.56.208.18/debian wheezy-updates main contrib non-free" >> /etc/apt/sources.list
			### Indica as pastas de pacotes principais, "não-livres" e livres (com licença copyright), novos programas
			echo "deb http://10.56.208.18/debian wheezy-backports main contrib non-free" >> /etc/apt/sources.list
			### Indica as pastas de pacotes principais, "não-livres" e livres (com licença copyright), com atualizações de segurança
			echo "deb http://10.56.208.18/debian-security/ wheezy/updates main contrib non-free" >> /etc/apt/sources.list

			clear
			egrep -v '^#|^ *$' /etc/apt/sources.list
			apt-get update
			apt upgrade -y
			clear
			echo "Atualização finalizada!"
			sleep 2
			exit 0
		fi

	elif [ $escolha -eq 3 ]; then
	### Se for igual a 3 instala a sources.list do repositório para Debian 6.0
	### Linux Debian 6.0

		if [ -e /etc/apt/sources.list.orig ]; then
			cp /etc/apt/sources.list /etc/apt/sources.list.bkp ### Copia a sources.list para um novo nome

			### Indica as pastas de pacotes principais, "não-livres" e livres (com licença copyright) no servidor
			echo "deb http://10.56.208.18/debian squeeze main non-free contrib " > /etc/apt/sources.list
			### Indica as pastas de pacotes principais, "não-livres" e livres (com licença copyright), com atualizações de segurança
			echo "deb http://10.56.208.18/debian-security/ squeeze/updates main contrib non-free" >> /etc/apt/sources.list

			clear
			egrep -v '^#|^ *$' /etc/apt/sources.list
			apt-get update
			apt upgrade -y
			clear
			echo "Atualização finalizada!"
			sleep 2
			exit 0
		else
			cp /etc/apt/sources.list /etc/apt/sources.list.orig ### Copia a sources.list para um novo nome

			### Indica as pastas de pacotes principais, "não-livres" e livres (com licença copyright) no servidor
			echo "deb http://10.56.208.18/debian squeeze main non-free contrib " > /etc/apt/sources.list
			### Indica as pastas de pacotes principais, "não-livres" e livres (com licença copyright), com atualizações de segurança
			echo "deb http://10.56.208.18/debian-security/ squeeze/updates main contrib non-free" >> /etc/apt/sources.list

			clear
			egrep -v '^#|^ *$' /etc/apt/sources.list
			apt-get update
			apt upgrade -y
			clear
			echo "Atualização finalizada!"
			sleep 2
			exit 0
		fi

	elif [ $escolha -eq 4 ]; then
	### Se for igual a 4 instala a sources.list do repositório para Debian 5.0
	### Linux Debian 5.0

		if [ -e /etc/apt/sources.list.orig ]; then
			cp /etc/apt/sources.list /etc/apt/sources.list.bkp ### Copia a sources.list para um novo nome

			### Indica as pastas de pacotes principais, "não-livres" e livres (com licença copyright) no servidor
			echo "deb http://10.56.208.18/debian lenny main non-free contrib " > /etc/apt/sources.list

			clear
			egrep -v '^#|^ *$' /etc/apt/sources.list
			apt-get update
			apt upgrade -y
			clear
			echo "Atualização finalizada!"
			sleep 2
			exit 0
		else
			cp /etc/apt/sources.list /etc/apt/sources.list.orig ### Copia a sources.list para um novo nome

			### Indica as pastas de pacotes principais, "não-livres" e livres (com licença copyright) no servidor
			echo "deb http://10.56.208.18/debian lenny main non-free contrib " > /etc/apt/sources.list

			clear
			egrep -v '^#|^ *$' /etc/apt/sources.list
			apt-get update
			apt upgrade -y
			clear
			echo "Atualização finalizada!"
			sleep 2
			exit 0
		fi

	else ### Em último caso do controle de fluxo if

		clear ### Limpa a tela

	echo "----------------------------"
	echo "-                          -"
	echo "-   Parâmetro inválido !   -" ### Mostra a uma tela de erro
	echo "-                          -"
	echo "----------------------------"

		exit 0

	fi ### Fim do segundo controle de fluxo if

fi ### Fim do primeiro controle de fluxo if

if [ $resposta2 -eq 2 ]
then

	if [ $escolha -eq 1 ]; then ### Inicio do controle de fluxo if para verificar valor da variável escolha2
	### Se for igual a 1 instala a sources.list do repositório para Ubuntu 16.0
	### Linux Ubuntu 16.04

		if [ -e /etc/apt/sources.list.orig ]; then
			cp /etc/apt/sources.list /etc/apt/sources.list.bkp ### Copia a sources.list para um novo nome

			### Indica as pastas de pacotes principais, restritos não oficiais e não livres no servidor
			echo "deb http://10.56.208.18/ubuntu/ xenial main restricted universe multiverse" > /etc/apt/sources.list 
			### Indica as pastas de pacotes principais, restritos não oficiais e não livres,  de segurança
			echo "deb http://10.56.208.18/ubuntu/ xenial-security main restricted universe multiverse" >> /etc/apt/sources.list
			### Indica as pastas de pacotes principais, restritos não oficiais e não livres, novos programas
			echo "deb http://10.56.208.18/ubuntu/ xenial-updates main restricted universe multiverse" >> /etc/apt/sources.list
			### Indica as pastas de pacotes principais do repositório de segurança
			echo "deb http://10.56.208.18/ubuntu-security/ xenial main" >> /etc/apt/sources.list
			### Indica as pastas de pacotes de segurança, principais restritos não oficiais e não livres, do repositório de segurança
			echo "deb http://10.56.208.18/ubuntu-security/ xenial-security main restricted universe multiverse" >> /etc/apt/sources.list
			### Indica as pastas de pacotes novos, principais restritos não oficiais e não livres, do repositório de segurança
			echo "deb http://10.56.208.18/ubuntu-security/ xenial-updates main restricted universe multiverse" >> /etc/apt/sources.list
			### Indica as pastas de pacotes principais, do repositório webupd8
			echo "deb http://10.56.208.18/ubuntu-webupd8/ xenial main" >> /etc/apt/sources.list

			clear
			egrep -v '^#|^ *$' /etc/apt/sources.list
			apt-get update
			apt upgrade -y
			clear
			echo "Atualização finalizada!"
			sleep 2
			exit 0
		else
			cp /etc/apt/sources.list /etc/apt/sources.list.orig ### Copia a sources.list para um novo nome

			### Indica as pastas de pacotes principais, restritos não oficiais e não livres no servidor
			echo "deb http://10.56.208.18/ubuntu/ xenial main restricted universe multiverse" > /etc/apt/sources.list
			### Indica as pastas de pacotes principais, restritos não oficiais e não livres,  de segurança
			echo "deb http://10.56.208.18/ubuntu/ xenial-security main restricted universe multiverse" >> /etc/apt/sources.list
			### Indica as pastas de pacotes principais, restritos não oficiais e não livres, novos programas
			echo "deb http://10.56.208.18/ubuntu/ xenial-updates main restricted universe multiverse" >> /etc/apt/sources.list
			### Indica as pastas de pacotes principais do repositório de segurança
			echo "deb http://10.56.208.18/ubuntu-security/ xenial main" >> /etc/apt/sources.list
			### Indica as pastas de pacotes de segurança, principais restritos não oficiais e não livres, do repositório de segurança
			echo "deb http://10.56.208.18/ubuntu-security/ xenial-security main restricted universe multiverse" >> /etc/apt/sources.list
			### Indica as pastas de pacotes novos, principais restritos não oficiais e não livres, do repositório de segurança
			echo "deb http://10.56.208.18/ubuntu-security/ xenial-updates main restricted universe multiverse" >> /etc/apt/sources.list
			### Indica as pastas de pacotes principais, do repositório webupd8
			echo "deb http://10.56.208.18/ubuntu-webupd8/ xenial main" >> /etc/apt/sources.list

			clear
			egrep -v '^#|^ *$' /etc/apt/sources.list
			apt-get update
			apt upgrade -y
			clear
			echo "Atualização finalizada!"
			sleep 2
			exit 0
		fi

	elif [ $escolha -eq 2 ]; then
	### Se for igual a 2 instala a sources.list do repositório para Ubuntu 14.04
	### Linux Ubuntu 14.04

		if [ -e /etc/apt/sources.list.orig ]; then
			cp /etc/apt/sources.list /etc/apt/sources.list.bkp ### Copia a sources.list para um novo nome

			### Indica as pastas de pacotes principais, restritos não oficiais e não livres no servidor
			echo "deb http://10.56.208.18/ubuntu/ trusty main restricted universe multiverse" > /etc/apt/sources.list
			### Indica as pastas de pacotes principais, restritos não oficiais e não livres,  de segurança
			echo "deb http://10.56.208.18/ubuntu/ trusty-security main restricted universe multiverse" >> /etc/apt/sources.list
			### Indica as pastas de pacotes principais, restritos não oficiais e não livres, novos programas
			echo "deb http://10.56.208.18/ubuntu/ trusty-updates main restricted universe multiverse" >> /etc/apt/sources.list
			### Indica as pastas de pacotes de parceiros (canonical)
			echo "deb http://10.56.208.18/canonical/ trusty partner" >> /etc/apt/sources.list
			### Indica as pastas de pacotes extras
			echo "deb http://10.56.208.18/ubuntu-extra/ trusty main" >> /etc/apt/sources.list
			### Indica as pastas de pacotes principais do repositório de segurança
			echo "deb http://10.56.208.18/ubuntu-security/ trusty main" >> /etc/apt/sources.list
			### Indica as pastas de pacotes de segurança, principais restritos não oficiais e não livres, do repositório de segurança
			echo "deb http://10.56.208.18/ubuntu-security/ trusty-security main restricted universe multiverse" >> /etc/apt/sources.list
			### Indica as pastas de pacotes novos, principais restritos não oficiais e não livres, do repositório de segurança
			echo "deb http://10.56.208.18/ubuntu-security/ trusty-updates main restricted universe multiverse" >> /etc/apt/sources.list
			### Indica as pastas de pacotes principais, do repositório ppa
			echo "deb http://10.56.208.18/ubuntu-ppa/ trusty main" >> /etc/apt/sources.list
			### Indica as pastas de pacotes principais, do repositório webupd8
			echo "deb http://10.56.208.18/ubuntu-webupd8/ trusty main" >> /etc/apt/sources.list

			clear
			egrep -v '^#|^ *$' /etc/apt/sources.list
			apt-get update
			apt upgrade -y
			clear
			echo "Atualização finalizada!"
			sleep 2
			exit 0

		else
			cp /etc/apt/sources.list /etc/apt/sources.list.orig ### Copia a sources.list para um novo nome

			### Indica as pastas de pacotes principais, restritos não oficiais e não livres no servidor
			echo "deb http://10.56.208.18/ubuntu/ trusty main restricted universe multiverse" > /etc/apt/sources.list
			### Indica as pastas de pacotes principais, restritos não oficiais e não livres,  de segurança
			echo "deb http://10.56.208.18/ubuntu/ trusty-security main restricted universe multiverse" >> /etc/apt/sources.list
			### Indica as pastas de pacotes principais, restritos não oficiais e não livres, novos programas
			echo "deb http://10.56.208.18/ubuntu/ trusty-updates main restricted universe multiverse" >> /etc/apt/sources.list
			### Indica as pastas de pacotes de parceiros (canonical)
			echo "deb http://10.56.208.18/canonical/ trusty partner" >> /etc/apt/sources.list
			### Indica as pastas de pacotes extras
			echo "deb http://10.56.208.18/ubuntu-extra/ trusty main" >> /etc/apt/sources.list
			### Indica as pastas de pacotes principais do repositório de segurança
			echo "deb http://10.56.208.18/ubuntu-security/ trusty main" >> /etc/apt/sources.list
			### Indica as pastas de pacotes de segurança, principais restritos não oficiais e não livres, do repositório de segurança
			echo "deb http://10.56.208.18/ubuntu-security/ trusty-security main restricted universe multiverse" >> /etc/apt/sources.list
			### Indica as pastas de pacotes novos, principais restritos não oficiais e não livres, do repositório de segurança
			echo "deb http://10.56.208.18/ubuntu-security/ trusty-updates main restricted universe multiverse" >> /etc/apt/sources.list
			### Indica as pastas de pacotes principais, do repositório ppa
			echo "deb http://10.56.208.18/ubuntu-ppa/ trusty main" >> /etc/apt/sources.list
			### Indica as pastas de pacotes principais, do repositório webupd8
			echo "deb http://10.56.208.18/ubuntu-webupd8/ trusty main" >> /etc/apt/sources.list

			clear
			egrep -v '^#|^ *$' /etc/apt/sources.list
			apt-get update
			apt upgrade -y
			clear
			echo "Atualização finalizada!"
			sleep 2
			exit 0
		fi

	elif [ $escolha -eq 3 ]; then
	### Se for igual a 3 instala a sources.list do repositório para Ubuntu 12.04
	### Linux Ubuntu 12.04

		if [ -e /etc/apt/sources.list.orig ]; then
			cp /etc/apt/sources.list /etc/apt/sources.list.bkp ### Copia a sources.list para um novo nome

			### Indica as pastas de pacotes principais, restritos não oficiais e não livres no servidor
			echo "deb http://10.56.208.18/ubuntu/ precise main restricted universe multiverse" > /etc/apt/sources.list
			### Indica as pastas de pacotes principais, restritos não oficiais e não livres,  de segurança
			echo "deb http://10.56.208.18/ubuntu/ precise-security main restricted universe multiverse" >> /etc/apt/sources.list
			### Indica as pastas de pacotes principais, restritos não oficiais e não livres, novos programas
			echo "deb http://10.56.208.18/ubuntu/ precise-updates main restricted universe multiverse" >> /etc/apt/sources.list
			### Indica as pastas de pacotes de parceiros (canonical)
			echo "deb http://10.56.208.18/canonical/ precise partner" >> /etc/apt/sources.list
			### Indica as pastas de pacotes de segurança de parceiros (canonical)
			echo "deb http://10.56.208.18/canonical/ precise-security partner" >> /etc/apt/sources.list
			### Indica as pastas de pacotes novos de parceiros (canonical)
			echo "deb http://10.56.208.18/canonical/ precise-updates partner" >> /etc/apt/sources.list
			### Indica as pastas de pacotes extras
			echo "deb http://10.56.208.18/ubuntu-extra/ precise main" >> /etc/apt/sources.list
			### Indica as pastas de pacotes principais do repositório de segurança
			echo "deb http://10.56.208.18/ubuntu-security/ precise main" >> /etc/apt/sources.list
			### Indica as pastas de pacotes de segurança, principais restritos não oficiais e não livres, do repositório de segurança
			echo "deb http://10.56.208.18/ubuntu-security/ precise-security main restricted universe multiverse" >> /etc/apt/sources.list
			### Indica as pastas de pacotes novos, principais restritos não oficiais e não livres, do repositório de segurança
			echo "deb http://10.56.208.18/ubuntu-security/ precise-updates main restricted universe multiverse" >> /etc/apt/sources.list
			### Indica as pastas de pacotes principais, do repositório ppa
			echo "deb http://10.56.208.18/ubuntu-ppa/ precise main" >> /etc/apt/sources.list
			### Indica as pastas de pacotes principais, do repositório webupd8
			echo "deb http://10.56.208.18/ubuntu-webupd8/ precise main" >> /etc/apt/sources.list

			clear
			egrep -v '^#|^ *$' /etc/apt/sources.list
			apt-get update
			apt upgrade -y
			clear
			echo "Atualização finalizada!"
			sleep 2
			exit 0

		else
			cp /etc/apt/sources.list /etc/apt/sources.list.orig ### Copia a sources.list para um novo nome

			### Indica as pastas de pacotes principais, restritos não oficiais e não livres no servidor
			echo "deb http://10.56.208.18/ubuntu/ precise main restricted universe multiverse" > /etc/apt/sources.list
			### Indica as pastas de pacotes principais, restritos não oficiais e não livres,  de segurança
			echo "deb http://10.56.208.18/ubuntu/ precise-security main restricted universe multiverse" >> /etc/apt/sources.list
			### Indica as pastas de pacotes principais, restritos não oficiais e não livres, novos programas
			echo "deb http://10.56.208.18/ubuntu/ precise-updates main restricted universe multiverse" >> /etc/apt/sources.list
			### Indica as pastas de pacotes de parceiros (canonical)
			echo "deb http://10.56.208.18/canonical/ precise partner" >> /etc/apt/sources.list
			### Indica as pastas de pacotes de segurança de parceiros (canonical)
			echo "deb http://10.56.208.18/canonical/ precise-security partner" >> /etc/apt/sources.list
			### Indica as pastas de pacotes novos de parceiros (canonical)
			echo "deb http://10.56.208.18/canonical/ precise-updates partner" >> /etc/apt/sources.list
			### Indica as pastas de pacotes extras
			echo "deb http://10.56.208.18/ubuntu-extra/ precise main" >> /etc/apt/sources.list
			### Indica as pastas de pacotes principais do repositório de segurança
			echo "deb http://10.56.208.18/ubuntu-security/ precise main" >> /etc/apt/sources.list
			### Indica as pastas de pacotes de segurança, principais restritos não oficiais e não livres, do repositório de segurança
			echo "deb http://10.56.208.18/ubuntu-security/ precise-security main restricted universe multiverse" >> /etc/apt/sources.list
			### Indica as pastas de pacotes novos, principais restritos não oficiais e não livres, do repositório de segurança
			echo "deb http://10.56.208.18/ubuntu-security/ precise-updates main restricted universe multiverse" >> /etc/apt/sources.list
			### Indica as pastas de pacotes principais, do repositório ppa
			echo "deb http://10.56.208.18/ubuntu-ppa/ precise main" >> /etc/apt/sources.list
			### Indica as pastas de pacotes principais, do repositório webupd8
			echo "deb http://10.56.208.18/ubuntu-webupd8/ precise main" >> /etc/apt/sources.list

			clear
			egrep -v '^#|^ *$' /etc/apt/sources.list
			apt-get update
			apt upgrade -y
			clear
			echo "Atualização finalizada!"
			sleep 2
			exit 0
		fi

	elif [ $escolha -eq 4 ]; then
	### Se for igual a 4 instala a sources.list do repositório para Ubuntu 8.10
	### Linux Ubuntu 8.10

		if [ -e /etc/apt/sources.list.orig ]; then
			cp /etc/apt/sources.list /etc/apt/sources.list.bkp ### Copia a sources.list para um novo nome

			### Indica as pastas de pacotes principais, restritos não oficiais e não livres no servidor
			echo "deb http://10.56.208.18/old-releases intrepid main restricted universe multiverse" > /etc/apt/sources.list
			### Indica as pastas de pacotes principais, restritos não oficiais e não livres,  de segurança
			echo "deb http://10.56.208.18/old-releases intrepid-security main restricted universe multiverse" >> /etc/apt/sources.list
			### Indica as pastas de pacotes principais, restritos não oficiais e não livres, novos programas
			echo "deb http://10.56.208.18/old-releases intrepid-updates main restricted universe multiverse" >> /etc/apt/sources.list

			clear
			egrep -v '^#|^ *$' /etc/apt/sources.list
			apt-get update
			apt upgrade -y
			clear
			echo "Atualização finalizada!"
			sleep 2
			exit 0

		else
			cp /etc/apt/sources.list /etc/apt/sources.list.orig ### Copia a sources.list para um novo nome

			### Indica as pastas de pacotes principais, restritos não oficiais e não livres no servidor
			echo "deb http://10.56.208.18/old-releases intrepid main restricted universe multiverse" > /etc/apt/sources.list
			### Indica as pastas de pacotes principais, restritos não oficiais e não livres,  de segurança
			echo "deb http://10.56.208.18/old-releases intrepid-security main restricted universe multiverse" >> /etc/apt/sources.list
			### Indica as pastas de pacotes principais, restritos não oficiais e não livres, novos programas
			echo "deb http://10.56.208.18/old-releases intrepid-updates main restricted universe multiverse" >> /etc/apt/sources.list

			clear
			egrep -v '^#|^ *$' /etc/apt/sources.list
			apt-get update
			apt upgrade -y
			clear
			echo "Atualização finalizada!"
			sleep 2
			exit 0
		fi

	else ### Em último caso do controle de fluxo if

		clear ### Limpa a tela

	echo "----------------------------"
	echo "-                          -"
	echo "-   Parâmetro inválido !   -" ### Mostra a uma tela de erro
	echo "-                          -"
	echo "----------------------------"

		exit 0

	fi ### Fim do segundo controle de fluxo if

fi ### Fim do primeiro controle de fluxo if

exit 0
