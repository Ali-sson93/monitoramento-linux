#!/bin/bash
RELATORIO="$HOME/Estudos/Projetos/monitoramento-linux/relatorios/relatorio.log"

USO_DISCO=$(df -h / | awk 'NR==2 {gsub("%","",$5); print $5}')
USO_MEMORIA=$(free | awk '/^Mem/ {printf "%.0f", $3/$2 * 100}')
USO_CPU=$(awk '/^cpu / {uso=($2+$4)*100/($2+$4+$5); printf "%.0f", uso}' /proc/stat)
{
echo "================="
echo  "Executado em: $(date)"


echo
echo "Uso de disco:"
df -h /

if [ "$USO_DISCO" -ge 80 ]; then

echo "ALERTA: uso do disco em ${USO_DISCO}%"

else
 
echo "Disco dentro do limite: ${USO_DISCO}%"
fi

echo
echo "Uso da memoria"
free -h

if [ "$USO_MEMORIA" -ge 80 ]; then

echo "ALERTA: uso da memoria em ${USO_MEMORIA}%"

else

echo "Memoria dentro do limite: ${USO_MEMORIA}%"

fi
echo
echo "Uso da Cpu"
if [ "$USO_CPU" -ge 80 ]; then

echo "ALERTA: uso da CPU em ${USO_CPU}%"

else

echo "CPU dentro do limite: ${USO_CPU}%"

fi
echo
echo "Conectividade:"

if curl -s --head --max-time 5 https://www.google.com > /dev/null; then
echo "Internet funcionando"

else
echo "ALERTA: sem conexão com a internet"

fi
} >> "$RELATORIO"
