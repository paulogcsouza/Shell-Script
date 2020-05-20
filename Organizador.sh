#!/usr/bin/env bash
#
# |Organizaap automatica da pasta de Downloads
#
#  Email:      paulogcsouza86@hotmail.com
#  Autor:      Paulo Souza                 Manutenção: Paulo Souza
#
# ------------------------------------------------------------------------ #
#  Histórico:
#   v1.3 11/5/2020 (Começou a funcionar)
#   v1.5 14/5/2020
#   v1.6 120/5/2020
#  Testado em:
#   bash 4.4.20(1)

# ------------------------------- VARIÁVEIS ------------------------------ #
VERMELHO="\033[31;1m"
CIANO="\033[36;1m"
VAR1=0
VAR2=0
VAR3=0
VAR4=0
VAR5=0
# ------------------------------- EXECUÇÃO ---------------------------------#

#-----------------------------------PDF-------------------------------------#

for i in $(find /home/gio/Downloads -maxdepth 1 -name *.pdf);
do

    let VAR1=VAR1+1
done

find /home/gio/Downloads -name *.pdf -exec mv {} /home/gio/Documentos \;

echo -e ${VERMELHO} Arquivos .pdf Movidos: ${CIANO}$VAR1

#---------------------------------ZIP----------------------------------------#

for i in $(find /home/gio/Downloads -maxdepth 1 -name *.zip);
do

    let VAR2=VAR2+1
done

find /home/gio/Downloads -name *.zip -exec mv {} /home/gio/Documentos \;

echo -e ${VERMELHO} Arquivos .zip Movidos: ${CIANO}$VAR2

#---------------------------------MP4----------------------------------------#

for i in $(find /home/gio/Downloads -maxdepth 1 -name *.mp4);
do

    let VAR3=VAR3+1
done

find /home/gio/Downloads -name *.mp4 -exec mv {} /home/gio/Vídeos \;

echo -e ${VERMELHO} Arquivos .mp4 Movidos: ${CIANO}$VAR3

#---------------------------------JPG----------------------------------------#

for i in $(find /home/gio/Downloads -maxdepth 1 -name *.jpg);
do

    let VAR4=VAR4+1
done

find /home/gio/Downloads -name *.jpg -exec mv {} /home/gio/Imagens \;

echo -e ${VERMELHO} Arquivos .jpg Movidos: ${CIANO}$VAR4

#---------------------------------PNG----------------------------------------#

for i in $(find /home/gio/Downloads -maxdepth 1 -name *.png);
do

    let VAR5=VAR5+1
done

find /home/gio/Downloads -name *.png -exec mv {} /home/gio/Imagens \;

echo -e ${VERMELHO} Arquivos .jpg Movidos: ${CIANO}$VAR5
