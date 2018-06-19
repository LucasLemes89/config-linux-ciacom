# /bin/bash

###########################################################
#                                                         #
#            Configuração Linux - versão 2017             #
#              Autor: Lucas da Silva lemes                #
#             E-mail: lemes.lucas@eb.mil.br               #
#                                                         #
#  Este script configura o linux para uso dentro do EB    #
# instalando softwares basicos, antivirus e ingressando   #
#                    no domínio da OM                     #
#                                                         #
###########################################################

mainframe() { ### Incio da função mainframe

	clear

	echo "####################################################################"
	echo "#                                                                  #"
	echo "#                  Escolha o que deseja fazer:                     #"
	echo "#                                                                  #"
	echo "####################################################################"
	echo "#                                                                  #"
	echo "# [1] Sources.list                                                 #"
	echo "# [2] Configurar Active Directory                                  #"
	echo "# [3] Instalar Antivirus                                           #"
	echo "# [4] Testar o Antivirus                                           #" ### Opções do menu
	echo "# [5] Instalar Java, Flash e Plano de Fundo                        #"
	echo "# [6] Corrigir problema na instalação do Antivirus                 #"
	echo "# [7] Sair                                                         #"
	echo "#                                                                  #"
	echo "####################################################################"
	echo "####################################################################"
	echo "#                                                                  #"
	echo "#                 Responda com o número da opção:                  #"
	echo "#                                                                  #"
	echo "####################################################################"

		read resp ### Lê e armazena o número digitado na variável resp

	case "$resp" in  ### controle de fluxo case para o valor da váriavel resp

	1) ### primeiro caso
		sourcelist ### chama a função sourceslist
	;; ### Break

	2) ### Segundo caso
		active ### chama a função active
	;; ### Break

	3) ### Terceiro caso
		antivirus ### chama a função antivirus
	;; ### Break

	4) ### Quarto caso
		testeantivirus ### chama a função testeantivirus
	;; ### Break

	5) ### Quinto caso
		conf_adc ### chama a função chrome
	;; ### Break

	6) ### Sexto caso
		correct ### chama a função correct
	;; ### Break

	*) ### Caso default
		clear ### limpa tela

		exit 0 ### Sai do programa

	esac ### fim do controle de fluxo case
	} ### Fim da função mainframe

  sourcelist () {
  	CAMINHOSH=`find /home/ -type f -name config_source.sh`
  	chmod +x "$CAMINHOSH"
    bash -c "$CAMINHOSH";
    ### espera até o escript acima terminar
    while ps -e | egrep "$CAMINHOSH" > /dev/null 
    do
    	sleep 5;
    done
    mainframe

  }

  active () {
  	CAMINHOSH=`find /home/ -type f -name script_conf_samba4_linux-v3.sh`
  	chmod +x "$CAMINHOSH"
    bash -c "$CAMINHOSH";
    ### espera até o escript acima terminar
    while ps -e | egrep "$CAMINHOSH" > /dev/null
    do
    	sleep 5;
    done
    mainframe
  }

  antivirus () {
  	CAMINHOSH=`find /home/ -type f -name antivirus.sh`
  	chmod +x "$CAMINHOSH"
    bash -c "$CAMINHOSH";
    ### espera até o escript acima terminar
    while ps -e | egrep "$CAMINHOSH" > /dev/null
    do
    	sleep 5;
    done
    mainframe
  }

  testeantivirus () {
  	CAMINHOSH=`find /home/ -type f -name testeantivirus.sh`
  	chmod +x "$CAMINHOSH"
    bash -c "$CAMINHOSH";
    ### espera até o escript acima terminar
    while ps -e | egrep "$CAMINHOSH" > /dev/null
    do
    	sleep 5;
    done
    mainframe
  }

  conf_adc () {
  	CAMINHOSH=`find /home/ -type f -name conf_adc.sh`
  	chmod +x "$CAMINHOSH"
    bash -c "$CAMINHOSH";
    ### espera até o escript acima terminar
    while ps -e | egrep "$CAMINHOSH" > /dev/null
    do
    	sleep 5;
    done
    mainframe
  }

  correct () {
  	CAMINHOSH=`find /home/ -type f -name correct_antivirus.sh`
  	chmod +x "$CAMINHOSH"
    bash -c "$CAMINHOSH";
    ### espera até o escript acima terminar
    while ps -e | egrep "$CAMINHOSH" > /dev/null
    do
    	sleep 5;
    done
    mainframe
  }


  clear
  echo "######################################################"
  echo "#                                                    #"
  echo "#         Bem vindo a configuração do Linux !        #"
  echo "#                                                    #"
  echo "######################################################"
  sleep 3
  clear


  echo "######################################################"
  echo "#                                                    #"
  echo "#  A configuração começará em seguida. Aguarde ...   #"
  echo "#                                                    #"
  echo "######################################################"
  sleep 2

  ### Verifica se é root, se não sai, se sim chama mainframe
  if [ "$(id -u)" != "0" ]; then
  	clear
	echo "Voce deve executar este script como root!"
	exit 0
  else
	mainframe
  fi