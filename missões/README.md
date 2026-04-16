# 🛡️ Missões de Gestão e Diagnóstico

Este diretório contém as missões práticas que simulam o dia a dia de um administrador de sistemas ou analista de SOC.

## Missão 1: Gestão de Identidade e Privilégios
O objetivo é simular a criação de um ambiente seguro para um time de analistas.

### Comandos Principais
- **Criação de Grupo**: `sudo groupadd -g 2000 redteam`
- **Criação de Usuário**: `sudo useradd -m -g 2000 -s /bin/bash analista1`
- **Investigação**: `id analista1` e `cat /etc/passwd | grep analista1`
- **Escalação de Privilégios**: `sudo visudo` (Adicionar `%redteam ALL=(ALL:ALL) NOPASSWD: /usr/bin/apt update`)
- **Limpeza**: `sudo userdel -r analista1`

---

## ⚙️ Missão 2: Controle de Processos e Fluxos
Aprenda a lidar com processos e automação de fluxos.

### Comandos Principais
- **Background Processes**: `sleep 1000 &`
- **Rastreamento**: `pgrep -la sleep`
- **Prioridade**: `renice 15 -p <PID>`
- **Hierarquia**: `pstree -aps $$`
- **Automação com Xargs**: `find te* | xargs rm -f`
- **Logs Simultâneos**: `ls -la /etc | tee lista_config.txt`

---

## 🛠️ Missão 3: Hardware e Diagnóstico
Investigação de hardware e diagnóstico de sistema.

### Comandos Principais
- **Informações Gerais**: `inxi -F`
- **Drivers/Módulos**: `lsmod`, `modprobe`, `modinfo`
- **Logs de Kernel**: `dmesg | grep -i "error"`
- **Hardware PCI**: `lspci`
