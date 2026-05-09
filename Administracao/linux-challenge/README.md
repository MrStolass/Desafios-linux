# 🐧 Linux Challenge — Backup Automático

Desafio prático de Linux focado em automação de backup, controle de permissões e monitoramento de processos via linha de comando.

**Nível:** Médio  
**Tópicos:** Bash · Cron · Permissões · Logrotate

---

## Estrutura do Projeto

```
linux-challenge/
├── backups/              # Arquivos .tar.gz gerados (chmod 700)
├── logs/                 # Logs do sistema (chmod 750, grupo devops)
├── scripts/
│   ├── backup.sh         # Script principal de backup
│   └── monitor.sh        # Script de monitoramento
├── config/
│   └── logrotate.conf    # Configuração do logrotate
└── README.md
```

---

## Tarefas do Desafio

- [ ] Criar a estrutura de diretórios
- [ ] Configurar permissões corretas em `backups/` e `logs/`
- [ ] Completar e testar o `scripts/backup.sh`
- [ ] Agendar o backup com `crontab` às 02:00 diariamente
- [ ] Configurar o `logrotate` usando `config/logrotate.conf`
- [ ] Completar e testar o `scripts/monitor.sh`
- [ ] Documentar troubleshooting encontrado neste README

---

## Como Usar

### 1. Clonar e configurar

```bash
git clone https://github.com/seu-usuario/linux-challenge
cd linux-challenge
chmod +x scripts/*.sh
```

### 2. Configurar permissões

```bash
# Criar grupo devops (se não existir)
sudo groupadd devops

# Permissões do diretório de backups (somente root)
sudo chown root:root backups/
sudo chmod 700 backups/

# Permissões dos logs (grupo devops pode ler)
sudo chown root:devops logs/
sudo chmod 750 logs/
```

### 3. Testar o backup manualmente

```bash
bash scripts/backup.sh /home/user/dados
```

### 4. Agendar com cron

```bash
crontab -e
# Adicionar:
0 2 * * * /caminho/absoluto/para/scripts/backup.sh /home/user/dados
```

### 5. Configurar logrotate

```bash
# Edite o caminho dentro do arquivo primeiro!
sudo cp config/logrotate.conf /etc/logrotate.d/linux-challenge

# Testar configuração
sudo logrotate --debug /etc/logrotate.d/linux-challenge
```

### 6. Rodar o monitoramento

```bash
bash scripts/monitor.sh
tail -f logs/monitor.log
```

---

## Verificação

```bash
# Listar backups gerados
ls -lh backups/

# Acompanhar log em tempo real
tail -f logs/backup.log

# Verificar cron agendado
crontab -l

# Forçar rotação de log
sudo logrotate -f /etc/logrotate.d/linux-challenge
```

---

## Troubleshooting

| Problema | Possível causa | Solução |
|----------|---------------|---------|
| `Permission denied` em `backups/` | Script não roda como root | Use `sudo` ou ajuste dono |
| Cron não executa o script | PATH incorreto no cron | Use caminho absoluto no crontab |
| `tar: command not found` no cron | PATH limitado do cron | Adicione `PATH=/usr/bin:/bin` no topo do crontab |
| Log não rotaciona | Arquivo vazio ou caminho errado | Confira o path no `logrotate.conf` |
| Monitor diz "nenhum backup" | `backups/` vazio | Rode `backup.sh` manualmente primeiro |

---

## Conceitos Praticados

- `chmod` e `chown` para controle de acesso
- `crontab` para agendamento de tarefas
- `logrotate` para gestão de logs
- `trap` e `set -euo pipefail` para scripts seguros
- `pgrep`, `stat`, `df` para monitoramento do sistema

---

## Autor

Feito como desafio prático de Linux 🐧
