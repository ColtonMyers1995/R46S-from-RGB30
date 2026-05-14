#!/bin/bash

PATCH_IMG="/roms/backup/mmcblk1_first64mb.img"
BACKUP_DIR="/roms/backup/r46s_prepatch_backup"

mkdir -p "$BACKUP_DIR"

clear
echo "========================================="
echo " R46S LOW-LEVEL BOOT PATCH TOOL"
echo "========================================="
echo ""
echo "This tool will:"
echo "1. Backup first 64MB of current OS SD"
echo "2. Write extracted STOCK boot region"
echo "3. Preserve existing partitions/files"
echo ""
echo "Patch image:"
echo "$PATCH_IMG"
echo ""

if [ ! -f "$PATCH_IMG" ]; then
    echo "ERROR: Patch image missing."
    echo ""
    echo "Expected:"
    echo "$PATCH_IMG"
    sleep 10
    exit 1
fi

echo "Backing up current first 64MB..."
dd if=/dev/mmcblk1 of="$BACKUP_DIR/current_first64mb_backup.img" bs=1M count=64 status=progress

sync

echo ""
echo "Applying stock low-level boot region..."
dd if="$PATCH_IMG" of=/dev/mmcblk1 bs=1M count=64 status=progress

sync

echo ""
echo "Patch complete."
echo ""
echo "IMPORTANT:"
echo "- Fully power off after this."
echo "- Wait 10 seconds."
echo "- Test TRUE cold boot."
echo ""
echo "Backup saved to:"
echo "$BACKUP_DIR"

sleep 15
