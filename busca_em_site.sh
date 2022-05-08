#!/usr/bin/env bash
#
# Conteúdo: Scrip em sell Leitura e armazenamento em txt de artigos título de artigo sobre Músixa no web site https://www.rafabasa.com/portada/
#
#  Email:      paulogcsouza86@hotmail.com
#  Autor:      Paulo Souza                 Manutenção: Paulo Souza
#
# ---------------------------------------------------------------------------- #
#  Histórico:
#   v1.0 11/4/2020 #  Histórico:
#   v1.0 11/4/2020
#  Testado em:
#   bash 4.4.20(1)
# ------------------------ VARIÁVEIS ----------------------------------------- #
ARQ=""
VERMELHO="\033[31;1m"
VERDE="\033[32;1m"
AZUL="\033[34;1m"
CIANO="\033[36;1m"
# ------------------------------- TESTES --------------------------------------#

[   -x "$(which lynx)" ] && echo -e " ${AZUL}  Lynx previamente instalado nessa máquina "                                                    # "-x" retorna true or false
[ ! -x "$(which lynx)" ] && echo -e " ${VERDE} Lynx vai ser intalado nessa máquina" && sudo apt install lynx -y

# ------------------------------------------------------------------------ #

# ------------------------------- EXECUÇÃO ----------------------------------------- #
ARQ="$(lynx -source https://www.rafabasa.com/portada/ | grep \<h3\ class\=\"entry\-title | sed 's/<\<h3\ class\=\"entry\-title.*bookmark\"\ title\=//' | sed 's/>.*//')"

if [ "$1" = "-h" ]; then
   echo -e "${CIANO} $ARQ" | sort && exit 0
 fi

echo -e "${VERMELHO} ${ARQ} "
echo -e "${AZUL} Caso queira essa lista em ordem alfabética selecione  novamente o comando a adicone '-h'"
# ------------------------------------------------------------------------ #
