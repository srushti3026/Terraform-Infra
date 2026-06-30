#!/bin/bash

TIMESTAMP=$(date +"%Y-%m-%d_%H-%M-%S")

LOG_DIR="./logs"
mkdir -p "$LOG_DIR"

LOG_FILE="$LOG_DIR/health_check_$TIMESTAMP.log"

EXIT_CODE=0

echo "System Health Check Report" | tee -a "$LOG_FILE"
echo "Generated: $(date)" | tee -a "$LOG_FILE" 
echo "" | tee -a "$LOG_FILE"

echo "Disk Usage:" | tee -a "$LOG_FILE"

bash check_disk.sh | tee -a "$LOG_FILE"

DISK_STATUS=${PIPESTATUS[0]}

if [ "$DISK_STATUS" -ne 0 ]; then
    EXIT_CODE=1
fi

echo "" | tee -a "$LOG_FILE"

echo "Memory Usage:" | tee -a "$LOG_FILE"

bash check_memory.sh | tee -a "$LOG_FILE"

echo "" | tee -a "$LOG_FILE"

echo "Docker Status:" | tee -a "$LOG_FILE"

bash check_docker.sh | tee -a "$LOG_FILE"

echo "" | tee -a "$LOG_FILE"

echo "Log File: $LOG_FILE" | tee -a "$LOG_FILE"

exit $EXIT_CODE
