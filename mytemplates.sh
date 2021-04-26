#! /bin/bash
#
#   mytemplates.sh - Cria um arquivo baseado em template no diretório atual
# 
#   Autor: Clerisson Nascimento
#
# --------------------------------------------------------------------------- #
#
#   Descrição:
#
#   Uso: 
#       mytemplates.sh [opções] arquivo_de_saida
#
#   Exemplos: 
#       1) $mytemplates.sh script.sh
#
#       2) $mytemplates.sh script.py
#
# --------------------------------------------------------------------------- #
#
#   Histórico:
#
#       25/04/2021 Versão 1.0: Versão inicial
#
# Licença: MIT
#
# ---------[ Declaração de variáveis ]--------------------------------------- #

declare -rx SCRIPT=$(basename "$0")
declare -rx TEMPLATES_PATH="$(dirname $BASH_SOURCE)""/templates"

# ---------[ Verificação de sanidade ]--------------------------------------- #

# Testa se é executado em BASH
if test -z "$BASH"; then
    echo "$SCRIPT: erro na linha $LINENO\nNão garanto que esse script funcione em outro shell que não seja o BASH."
    exit 192
fi

# Testa se o diretório de templates existe
if test -e "$TEMPLATES_PATH""/tpt_bash2.sh"
then
    echo echo "$SCRIPT: erro na linha $LINENO\nDiretórios de templates não encontrado"
fi
#
# ---------[ Opções de linha de comando ]------------------------------------ #
#
MENSAGEM_USO="
Uso: $(basename 0) [OPÇÕES] arquivo_de_saida

OPÇÔES:
    -h, --help      Mostra essa ajuda e sai.
    -V, --version   Mostra a versão atual do script e sai.
    -t, --template  Especifica qual a linguagem do arquivo.
    -l, --list      Lista os templates válidos e sai.
    -o, --output    Caminho completo do arquivo de saída.
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
        -l | --list)
        
            echo "Templates disponíveis:"
            echo "- bash"
            echo "- python_dataviz"
            echo
            exit 0
        ;;
        -t | --template)
            shift
            case "$1" in
                bash | BASH | Bash)
                    TEMPLATE="tpt_bash.sh"
                    OUTPUT="${OUTPUT:=script.sh}"
                ;;
                python | python_dataviz | "python dataviz")
                    TEMPLATE="tpt_python_dataviz.py"
                    OUTPUT="${OUTPUT:=script.py}"
                ;;
                
                *)
                    echo "Tamplate inválido."
                    exit 192
                ;;
            esac
        ;;
        -o | --output)
            shift
            OUTPUT="$1"
        ;;
    esac
    shift
done

# ---------[ Testes iniciais ]----------------------------------------------- #

# Testa se a variável template está definida.
# caso contrário dá erro e solicita seu valor
if test -z ${TEMPLATE}
then
    ERRMSG="Template não definido. Para listar os templates válidos faça: ${SCRIPT} -l"
    echo "$ERRMSG"
    exit 0
fi

# ---------[ Programa principal ]-------------------------------------------- #

cat "${TEMPLATES_PATH}/${TEMPLATE}" > "$OUTPUT"
echo Template criado em "$OUTPUT"

# ---------[ Limpeza ]------------------------------------------------------- #
exit 0
#
#
#
