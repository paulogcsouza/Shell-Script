#!/usr/bin/env bash
#
# Infomação do sistema no terminal
#
#  Email:      paulogcsouza86@hotmail.com
#  Autor:      Paulo Souza                 Manutenção: Paulo Souza
#
# --------------------------------------------------------------------------#
#  Histórico:
#   v1.0 21/8/2020
#   v1.3 25/8/2020
#   v1.4 29/8/2020
#   Testado em:
#   bash 4.4.20(1)
# -------------------------------VARIÀVEIS--------------------------------- #

VERMELHO="\033[31;1m"
CIANO="\033[36;1m"
CINZA="\033[37;1m"
AMARELO="\033[33;1m"
AZUL="\033[34;1m"
VAR=$(hostname)
RESPOSTA0=0
RESPOSTA1=0
RESPOSTA2=0
RESPOSTA3=0
RESPOSTA4=0
# ---------------------------------TESTE 1---------------------------------- #

echo "Você gostaria de informações sobre o sistema? [s/n] "
read RESPOSTA0
test "$RESPOSTA0" != "s" && exit

echo -e "$AMARELO Nome do Usuários que esta rodando esse script é:$AZUL $VAR"

echo -e "$CIANO Data e horário local:"
date                                      #data local
echo
echo -e "$VERMELHO Uso do disco:"
df -h                                    #Uso da memória
echo
echo -e "$CINZA Usuários conectados:"
w                                        #Usuários logados
echo ""

# ---------------------------------TESTE 2---------------------------------- #

echo -e "$AMARELO Gostaria de concultar o calendário ? [s/n]"
read RESPOSTA1
test "$RESPOSTA1" != "s" && echo -e "$AMARELO Tenha um bom dia !!!" && exit
echo -e "$CIANO"
cal
echo ""
# ---------------------------------TESTE 3---------------------------------- #

echo -e "$AMARELO Gostaria de Informações complementares Sobre o Hardware [s/n]"
read RESPOSTA2
test "$RESPOSTA2" != "s" && echo -e "$AMARELO Tenha um bom dia !!!" && exit
echo -e "$AZUL"
lscpu | sed -n '1,24p' # lista apenas as 24 primeiras linhs (Que são as relevantes para essa função )
echo ""
# ---------------------------------TESTE 4---------------------------------- #

echo -e "$AMARELOGostaria de Informações Sistama Operacional [s/n]"
read RESPOSTA3
test "$RESPOSTA3" != "s" && echo -e "$AMARELO Tenha um bom dia !!!" && exit
echo -e "$VERMELHO Sistema Operacional:"
lsb_release -a | sed -n '2,4p'
echo ""
# ---------------------------------TESTE 5---------------------------------- #

echo -e "$AMARELO Gostaria de Informações Avançadas Sobre os Barramentos [s/n]"
read RESPOSTA4
test "$RESPOSTA4" != "s" && echo -e "$AMARELO Tenha um bom dia !!!" && exit
echo -e "$CIANO Barramentos:"
lspci
echo ""
echo -e "$AMARELO Tenha um bom dia !!!" && exit
