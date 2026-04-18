## 💣 Cenário 1: Bomba de arquivos e organização eficiente

Este cenário simula uma resposta a incidentes onde precisamos isolar arquivos de log específicos criados recentemente e manter uma trilha de auditoria de cada arquivo movido.

### O Desafio:
1. **Gerar a massa de dados:** Criar 1000 arquivos (500 `.txt` e 500 `.log`).
2. **Filtragem Inteligente:** Localizar apenas arquivos `.log` criados nos últimos 10 minutos.
3. **Isolamento Seguro:** Mover os arquivos para uma pasta de quarentena sem deletar dados.
4. **Auditoria (Log do Log):** Registrar cada movimentação em um arquivo externo em tempo real.

   
![Demonstração do Script](gif1.gif)
### Resolução Técnica:

```bash
# 1. Preparação do ambiente
mkdir -p /tmp/quarentena
touch file{1..500}.txt file{1..500}.log

# 2. Execução da Pipeline de Automação
find . -name "*.log" -type f | xargs -I {} mv -v {} /tmp/quarentena/ | tee movimentacao.txt

```
   
![Demonstração do Script](gif2.gif)
