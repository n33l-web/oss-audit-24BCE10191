#!/bin/bash
# Script 4: Log File Analyzer
# Author: [Your Name] | Course: Open Source Software
# Usage:   ./log_analyzer.sh /var/log/syslog [keyword]

LOGFILE=$1
KEYWORD=${2:-"error"}
COUNT=0
MATCH_LINES=()

if [ ! -f "$LOGFILE" ]; then
    echo "Error: File '$LOGFILE' not found."
    echo "Usage: $0 <logfile> [keyword]"
    exit 1
fi

echo "=============================="
echo " Log File Analyzer"
echo "=============================="
echo "File   : $LOGFILE"
echo "Keyword: '$KEYWORD'"
echo ""

# While read loop: process the file line by line
while IFS= read -r LINE; do
    if echo "$LINE" | grep -iq "$KEYWORD"; then
        COUNT=$((COUNT + 1))
        MATCH_LINES+=("$LINE")
    fi
done < "$LOGFILE"

echo "Result: Keyword '$KEYWORD' found $COUNT time(s) in $LOGFILE"
echo ""

if [ $COUNT -gt 0 ]; then
    echo "--- Last 5 matching lines ---"
    TOTAL=${#MATCH_LINES[@]}
    START=$(( TOTAL > 5 ? TOTAL - 5 : 0 ))
    for (( i=START; i<TOTAL; i++ )); do
        echo "  ${MATCH_LINES[$i]}"
    done
else
    echo "No lines matching '$KEYWORD' were found."
fi

echo ""
echo "=============================="
