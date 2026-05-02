cat << 'EOF' > gerar_arquivos.sh
#!/bin/bash


TOTAL=1000
DIR_DESTINO="./teste_arquivos"

# Cria o diretório se não existir
mkdir -p "$DIR_DESTINO"

echo "Criando $TOTAL arquivos em $DIR_DESTINO..."

# Loop para criação rápida
for i in $(seq 1 $TOTAL); do
    touch "$DIR_DESTINO/arq_$i.txt"
done

echo "Concluído!"
EOF

chmod +x gerar_arquivos.sh
