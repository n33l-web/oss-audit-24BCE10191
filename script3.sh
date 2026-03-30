#!/bin/bash
# Script 3: Disk and Permission Auditor
# Author: [Your Name] | Course: Open Source Software
# Purpose: Audit key Linux directories for disk usage and permissions.

DIRS=("/etc" "/var/log" "/home" "/usr/bin" "/tmp" "/usr/lib/python3")

echo "========================================"
echo "  Directory Audit Report"
echo "  Generated: $(date '+%Y-%m-%d %H:%M:%S')"
echo "========================================"
printf "%-30s %-20s %-10s\n" "Directory" "Permissions/Owner" "Size"
echo "----------------------------------------"

# For loop: iterate over each directory in the array
for DIR in "${DIRS[@]}"; do
    if [ -d "$DIR" ]; then
        # Extract permissions and owner using ls -ld, piped through awk
        PERMS=$(ls -ld "$DIR" | awk '{print $1, $3, $4}')
        SIZE=$(du -sh "$DIR" 2>/dev/null | cut -f1)
        printf "%-30s %-20s %-10s\n" "$DIR" "$PERMS" "${SIZE:-N/A}"
    else
        printf "%-30s %-20s %-10s\n" "$DIR" "[does not exist]" "-"
    fi
done

echo "========================================"
echo ""
PYTHON_CONFIG="/usr/lib/python3"
echo "--- Python Installation Check ---"
if [ -d "$PYTHON_CONFIG" ]; then
    echo "Python library directory found at $PYTHON_CONFIG"
    ls -ld "$PYTHON_CONFIG"
    echo ""
    echo "Number of files in Python library:"
    find "$PYTHON_CONFIG" -type f | wc -l
else
    echo "Python library directory not found at expected path."
fi
