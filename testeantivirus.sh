# /bin/bash

clear

echo "------------------------------------------------"
echo "-                                              -"
echo "-  Iniciando o teste do antivírus corporativo  -" ### Exibe aviso de início da teste do antivírus
echo "-                                              -"
echo "------------------------------------------------"
sleep 2
clear

echo "Testando se o agente foi instalado corretamente:"
/opt/kaspersky/klnagent/bin/klnagchk
sleep 4
clear


echo "Testando se o antivírus foi instalado corretamente:"
/opt/kaspersky/kesl/bin/kesl-control -S
sleep 4
clear


echo "Verificando se os processos do antivírus estão em execução:"
ps aux | grep kaspersky
sleep 4
clear


exit 0
