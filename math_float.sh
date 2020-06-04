#!/usr/bin/env bash
#
# Arquivos de Configuração
#
#  Email:      paulogcsouza86@hotmail.com
#  Autor:      Paulo Souza                 Manutenção: Paulo Souza
#
#-------------------------------------------------------------------------------#
#  Histórico:
#   v1.0 3/4/2020 (Começou a funcionar)
#
#  Testado em:
#   bash 4.4.20(1)

# ----------------------------------VARIÁVEIS---------------------------------- #
A1=0
A2=0


# -------------------------------Interação Usuário----------------------------- #

echo "Por favor, digite o primeiro número:";  # Exibe a frase na tela
read A1  # Armazena o primeiro número digitado pelo usuário na variável 'numero1'

echo "Por favor, digite o segundo número:";  # Exibe a frase na tela
read A2  # Armazena o segundo número digitado pelo usuário na variável 'numero2'



echo "Por favor, selecione a operação matemática:";  # Exibe a frase na tela
echo "[1] Soma   [2] Subtração   [3] Multiplicação   [4] Divisão:"
read operacao
echo "--------------------------------------------------------------------------"
# -----------------------------------EXECUÇÃO-----------------------------------#
if [ $operacao = "1" ]; then
  echo "O resultado da Adição é:"
  echo "scale=5 ; $A1 + $A2" | bc
else if [ $operacao = "2" ]; then
  echo "O resiltado da Subtração é:"
  echo "scale=5 ; $A1 - $A2" | bc
else if [ $operacao = "3" ]; then
  echo "O resiltado da operação é:"
  echo "scale=5 ; $A1 * $A2" | bc
else if [ $operacao = "4" ]; then
   echo "O resiltado da operação é:"
   echo "scale=5 ; $A1 / $A2" | bc


else
 echo "Operação Inválida, temte novamente "
fi
fi
fi
fi
