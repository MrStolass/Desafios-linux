# 🧠 🔥 Nível 4: Cenários Reais (Profissional)

Esta seção apresenta cenários de troubleshooting e automação, onde o objetivo é resolver problemas específicos de administração de sistemas.

## 💣 Cenário 1: Usuário sem acesso
O problema envolve um usuário que não consegue acessar o diretório `/projeto`. A resolução deve focar em verificar a qual grupo o usuário pertence e ajustar as permissões do diretório usando `chown` e `chmod`.

## 💣 Cenário 2: Sistema lento
Quando o sistema apresenta lentidão, o administrador deve usar ferramentas de monitoramento como `top` ou `ps` para identificar o processo que está consumindo excesso de recursos. A solução pode envolver diminuir a prioridade do processo com `renice` ou encerrá-lo se necessário.

## 💣 Cenário 3: Processo travado
Em casos onde um programa não responde aos comandos normais de fechamento, deve-se utilizar o sinal de encerramento forçado. A prática recomendada é tentar primeiro o `kill` (SIGTERM) e, se não houver resposta, utilizar o `kill -9` (SIGKILL).

## 💣 Cenário 4: Hardware não reconhecido
Para dispositivos não detectados, o fluxo de diagnóstico deve incluir a verificação dos logs do kernel com `dmesg`, a listagem de barramentos com `lsusb` ou `lspci`, e a tentativa de carregar o driver manualmente com `modprobe`.

## 💣 Cenário 5: Automação real
A automação é essencial para tarefas repetitivas. O desafio proposto é criar um script simples de manutenção (ex: limpeza de logs ou backup) e agendar sua execução periódica utilizando o `cron`.
