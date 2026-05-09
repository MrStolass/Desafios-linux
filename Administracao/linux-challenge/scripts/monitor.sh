#!/usr/bin/env bash
set -euo pipefail

LOG_FILE="$(dirname "$0")/../logs/backup.log"
BACKUP_DIR="$(dirname "$0")/../backups"
ALERT_LOG="$(dirname "$0")/../logs/monitor.log"

log() {
    echo "[$(date '+%Y-%m-%d %H:%M:%S')] $1" | tee -a "$ALERT_LOG"
}

# Verifica se o processo de backup está rodando
if pgrep -f "backup.sh" > /dev/null 2>&1; then
    log "OK: processo de backup está em execução."
else
    log "INFO: nenhum processo de backup ativo no momento."
fi

# Verifica se há backup recente (últimas 25h)
LATEST=$(ls -t "${BACKUP_DIR}"/*.tar.gz 2>/dev/null | head -1 || true)

if [ -z "$LATEST" ]; then
    log "ALERTA: nenhum arquivo de backup encontrado em $BACKUP_DIR!"
    exit 1
fi

AGE=$(( ($(date +%s) - $(stat -c %Y "$LATEST")) / 3600 ))

if [ "$AGE" -gt 25 ]; then
    log "ALERTA: último backup tem ${AGE}h — possível falha no agendamento!"
else
    log "OK: último backup há ${AGE}h — $(basename "$LATEST")"
fi

# Verifica espaço em disco
DISK_USAGE=$(df -h "${BACKUP_DIR}" | awk 'NR==2 {print $5}' | tr -d '%')
if [ "$DISK_USAGE" -gt 85 ]; then
    log "ALERTA: disco em ${DISK_USAGE}% de uso — considere limpar backups antigos."
else
    log "OK: uso de disco em ${DISK_USAGE}%."
fi
