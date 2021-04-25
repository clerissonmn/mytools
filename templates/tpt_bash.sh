#! /bin/bash
#
#   script.sh - Descrição sucinta
# 
#   Site: 
#   Autor:
#   Manutenção: 
#
# --------------------------------------------------------------------------- #
#
#   Descrição:
#
#   Uso: 
#       script.sh [opções] parâmetro1
#
#   Exemplos: 
#       $ script.sh -h -f teste 
#       
#   Descrição Adicional:
#       Este script faz isso, desta forma, etc.
#
# --------------------------------------------------------------------------- #
#
#   Histórico:
#
#       25/04/2021 Versão 1.0: Feito isso, isso, isso, isso
#                              mais isso e isso e isso...
#
# NOTA: A nomenclatura da versão é usada pelo parâmetro -V para extrair
#       a versão atual automaticamente. Lembrar de ajustar caso for mudado.
#
# Licença: MIT
#
# --------------------------------------------------------------------------- #
#
# ---------[ Flags ]--------------------------------------------------------- #
#
#   flag1=1
#
#   Sugestões de teste da flag
#
#      1) [ "$flag1" = 1 ] && echo "Chave Ligada"
#
#      2) test "$flag1" = 1  && echo "Chave Ligada"
#
#      3) if test "$flag1" = 1
#         then
#             <...>
#         else
#             <...>
#         fi
#
# NOTA: Valor 1 liga chave. Qualquer outro valor desliga a chave
#
# ---------[ Opções de linha de comando ]------------------------------------ #
#
MENSAGEM_USO="
Uso: $0 [OPÇÕES]

OPÇÔES:
    -h, --help      Mostra essa ajuda e sai
    -V, --version   Mostra a versão atual do script e sai
"

# Tratamento
while test -n "$1"
do
    case "$1" in
        -h | --help)
            echo "$MENSAGEM_USO"
            exit 0
        ;;
        -V | --version)
            echo -n $(basename "$0")" "
            grep -E "^#\s+[0-9]+\/[0-9]+\/[0-9]+\sVersão\s+[0-9]+\.[0-9]+\:" tpt_bash.sh | tail -1 | grep -Eo "Versão\s+[0-9]+\.[0-9]+"   
            exit 0
        ;;
        # Opções que controlam flag
        # -f | --flag   ) flag1=1    ;;
        #
        # Opções com argumentos: -p argumento
        #
        # -p | --parametro )
        #   shift
        #   argumento="$1"
        #
        #   if test -z "$argumento"
        #   then
        #       echo "Faltou o argumento para opção -p"
        #;;
    esac
    shift
done
#
# ---------[ Declaração de variáveis ]--------------------------------------- #

declare -rx SCRIPT=$(basename "$0")

# ---------[ Verificação de sanidade ]--------------------------------------- #

if test -z "$BASH"; then
    echo "$SCRIPT: erro na linha $LINENO\nNão garanto que esse script funcione em outro shell que não seja o BASH."
    exit 192
fi

# ---------[ Início do programa ]-------------------------------------------- #
echo "Hello World!"
# ---------[ Fim do programa ]----------------------------------------------- #
# ---------[ Limpeza ]------------------------------------------------------- #
exit 0
#
#
#
