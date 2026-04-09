#!/bin/bash


SOURCE_DIR=$1
BACKUP_DIR="backups"
LOG_FILE="backup.log"

if [ -z "$SOURCE_DIR" ]; then
	echo "Usage: ./backup.sh <folder>" | tee -a $LOG_FILE
	exit 1
fi

if [ ! -d "$SOURCE_DIR" ]; then
	echo "Error: Directory doesn't exist!" | tee -a $LOG_FILE
	exit 1
fi

mkdir -p $BACKUP_DIR

# Delete backups older than 2 days
find $BACKUP_DIR -type f -name "*.tar.gz" -mtime +2 -exec rm {} \;

TIMESTAMP=$(date +"%Y-%m-%d_%H-%M-%S")
BACKUP_FILE="$BACKUP_DIR/backup_$TIMESTAMP.tar.gz"

echo "Taking backup of $SOURCE_DIR..." | tee -a $LOG_FILE

tar -czf $BACKUP_FILE $SOURCE_DIR

echo "Backup completed: $BACKUP_FILE" >> $LOG_FILE

