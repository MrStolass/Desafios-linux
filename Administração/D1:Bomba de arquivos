Lab: Manipulação de Arquivos e Automação com Bash

Este repositório contém exercícios práticos de filtragem, movimentação e log de arquivos em sistemas Linux utilizando os comandos find, xargs e tee.
🛠️ O Desafio

O objetivo deste laboratório foi criar um ambiente de simulação com 1000 arquivos e automatizar a migração de logs específicos para uma pasta de quarentena, registrando todo o histórico da operação.
1. Criando o ambiente (A Bagunça)

Comando para gerar 500 arquivos .txt e 500 arquivos .log simultaneamente:
Bash

touch file{1..500}.txt file{1..500}.log

2. Executando o Filtro e a Movimentação

O comando abaixo realiza as seguintes ações:

    Filtra: Arquivos .log criados nos últimos 10 minutos.

    Segurança: Usa -print0 para evitar erros com espaços nos nomes.

    Execução: Move os arquivos para /tmp/quarentena/.

    Log: Registra a saída da operação em um arquivo texto.

Bash

find . -name "*.log" -mmin -10 -type f -print0 | xargs -0 -I {} mv -v {} /tmp/quarentena/ | tee movimento.txt

📝 Explicação Técnica dos Comandos
Comando	Função
find .	Inicia a busca no diretório atual.
-mmin -10	Filtra arquivos modificados nos últimos 10 minutos.
-print0	Usa o caractere nulo como separador (evita erros com espaços).
xargs -0	Recebe a lista separada por nulo do find.
mv -v	Move os arquivos no modo verbose, gerando saída para o log.
tee	Exibe o resultado na tela e grava simultaneamente no arquivo movimento.txt.
