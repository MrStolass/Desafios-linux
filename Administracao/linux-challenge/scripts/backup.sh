#!/usr/bin/env bash
set -euo pipefail

BACKUP_DIR="$(dirname "$0")/../backups"
LOG_FILE="$(dirname "$0")/../logs/backup.log"
SOURCE_DIR="${1:-/home/user/dados}"
TIMESTAMP=$(date +"%Y%m%d_%H%M%S")
FILENAME="backup_${TIMESTAMP}.tar.gz"

log() {
    echo "[$(date '+%Y-%m-%d %H:%M:%S')] $1" | tee -a "$LOG_FILE"
}

trap 'log "ERRO: backup falhou ou foi interrompido."; exit 1' ERR

log "Iniciando backup de $SOURCE_DIR..."

if [ ! -d "$SOURCE_DIR" ]; then
    log "AVISO: diretório fonte não encontrado: $SOURCE_DIR"
    exit 1
fi

tar -czf "${BACKUP_DIR}/${FILENAME}" "$SOURCE_DIR" 2>> "$LOG_FILE"

SIZE=$(du -sh "${BACKUP_DIR}/${FILENAME}" | cut -f1)
log "Backup concluído: $FILENAME ($SIZE)"

# Manter apenas os 7 backups mais recentes
ls -t "${BACKUP_DIR}"/*.tar.gz 2>/dev/null | tail -n +8 | xargs -r rm --
log "Limpeza de backups antigos concluída."
