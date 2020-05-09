#!/usr/bin/env bash
#
# |Arquivos de Configuração
#
#  Email:      paulogcsouza86@hotmail.com
#  Autor:      Paulo Souza                 Manutenção: Paulo Souza
#
# ---------------------------------------------------------------------------- #
#  Histórico:
#   v1.0 24/4/2020 (Começou a funcionar)
#   v1.1 26/4/2020
#  Testado em:
#   bash 4.4.20(1)
ARQUIVO_BANCO_DE_DADOS="banco_de_dados.txt"
SEP=:    #variavel para o separador, usado facilitar mudança
TEMP=temp.$$ #arquivo temporário
VERDE="\033[32;1m"
VERMELHO="\033[31;1m"
# ------------------------------------------------------------------------ #

# ------------------------------- TESTES ----------------------------------------- #
[ ! -e "$ARQUIVO_BANCO_DE_DADOS" ] && echo "ERRO. Arquivo não existe." && exit 1 # testando a existência do banco de dados
[ ! -r "$ARQUIVO_BANCO_DE_DADOS" ] && echo "ERRO. Arquivo não tem permissão de leitura." && exit 1 #permição de leitura
[ ! -w "$ARQUIVO_BANCO_DE_DADOS" ] && echo "ERRO. Arquivo não tem permissão de escrita." && exit 1 #permição de escrita.
[ ! -x "$(which dialog)" ] && sudo apt install dialog 1> /dev/null 2>&1
# ------------------------------------------------------------------------ #

# ------------------------------- FUNÇÕES ----------------------------------------- #

ListaColeçãoVinil () {
  while read -r linha
  do
    [ "$(echo $linha | cut -c1)" = "#" ] && continue   # pula linha de comentário
    [ ! "$linha" ] && continue # pula linha em branco

    MostrarColecao "$linha"
  done < "$ARQUIVO_BANCO_DE_DADOS"
}

ValidaExistenciaAlbum () {
  grep -i -q "$1$SEP" "$ARQUIVO_BANCO_DE_DADOS" # -i ingora miusculas e minusculas -q quieto e retorna boleano resultado
}

InsereNovoAlbum () {
  local nome="$(echo $1 | cut -d $SEP -f 2)"

  if ValidaExistenciaAlbum "$nome"
  then
    echo "Albúm já cadastrado"
  else
    echo "$*" >> "$ARQUIVO_BANCO_DE_DADOS"
    echo "Albúm cadastrado com sucesso!"
  fi
  OrdenaLista
}

ApagaAlbum () {
  ValidaExistenciaAlbum "$1" || return

  grep -i -v "$1$SEP" "$ARQUIVO_BANCO_DE_DADOS" > "$TEMP"
  mv "$TEMP" "$ARQUIVO_BANCO_DE_DADOS"

  echo "Albúm removido com sucesso!"
  OrdenaLista
}

OrdenaLista () {
  sort "$ARQUIVO_BANCO_DE_DADOS" > "$TEMP"
  mv "$TEMP" "$ARQUIVO_BANCO_DE_DADOS"
}
# ------------------------------------------------------------------------ #
