# 🧩 Exercícios Práticos por Nível

Esta seção contém exercícios graduais para consolidar o conhecimento em administração Linux.

## 🧪 🔰 Nível 1: Fundamentos (Usuários e Grupos)
O objetivo aqui é simular o ambiente de uma empresa.

| Exercício | Descrição | Comando Sugerido |
| :--- | :--- | :--- |
| **E1** | Criar usuários `dev1`, `dev2`, `admin1` e grupos `devs`, `admins`. | `useradd`, `groupadd` |
| **E2** | Criar diretório `/projeto` acessível apenas por `devs`. | `chown`, `chmod` |
| **E3** | Alterar e reverter o shell do usuário `dev1`. | `chsh -s /bin/bash dev1` |
| **E4** | Configurar acesso `sudo` para `admin1` e bloquear para `devs`. | `visudo` |
| **E5** | Excluir o usuário `dev2` e seu diretório home. | `userdel -r dev2` |

## ⚙️ 🔥 Nível 2: Processos (Vida Real)
Práticas para lidar com processos, prioridades e monitoramento.

| Exercício | Descrição | Comando Sugerido |
| :--- | :--- | :--- |
| **E6** | Criar, listar e encerrar processos `sleep`. | `ps`, `kill`, `pkill` |
| **E7** | Alterar prioridade de processos com `nice` e `renice`. | `nice -n 10`, `renice` |
| **E8** | Alternar entre `background` e `foreground`. | `bg`, `fg`, `Ctrl+Z` |
| **E9** | Monitorar consumo de CPU e RAM. | `top`, `htop` |
| **E10** | Identificar hierarquia de processos. | `pstree`, `pgrep` |
| **E11** | Diferenciar sinais de encerramento (`kill`, `kill -9`). | `kill -SIGTERM`, `kill -9` |
| **E12** | Salvar logs e exibir na tela simultaneamente. | `tee` |
| **E13** | Manipular múltiplos arquivos em lote. | `xargs` |

## 🖥️ ⚡ Nível 3: Hardware e Sistema
Investigação e diagnóstico de componentes físicos e módulos do kernel.

| Exercício | Descrição | Comando Sugerido |
| :--- | :--- | :--- |
| **E14** | Identificar CPU, USB e Placa de Rede. | `lscpu`, `lsusb`, `lspci` |
| **E15** | Analisar mensagens de boot e logs do sistema. | `dmesg | less` |
| **E16** | Filtrar erros reais no log do kernel. | `dmesg | grep error` |
| **E17** | Listar e inspecionar detalhes de módulos do kernel. | `lsmod`, `modinfo` |
| **E18** | Carregar e remover módulos manualmente. | `modprobe`, `rmmod` |
| **E19** | Gerar um relatório completo do sistema. | `inxi -F` |
