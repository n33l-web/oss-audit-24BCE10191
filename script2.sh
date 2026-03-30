#!/bin/bash
# Script 2: FOSS Package Inspector
# Author: [Your Name] | Course: Open Source Software
# Purpose: Check if a FOSS package is installed, display version/license
#          info, and print a philosophical note via case statement.

PACKAGE="python3"

echo "=============================="
echo " FOSS Package Inspector"
echo "=============================="
echo ""

# Check if package is installed using dpkg (Debian/Ubuntu)
if dpkg -l "$PACKAGE" &>/dev/null; then
    echo "[OK] $PACKAGE is installed on this system."
    echo ""
    echo "--- Package Details ---"
    dpkg -s "$PACKAGE" | grep -E 'Version|Status|Installed-Size|Maintainer'
    echo ""
    echo "Interpreter version: $(python3 --version 2>&1)"
else
    echo "[WARN] $PACKAGE is NOT installed."
    echo "Install with: sudo apt install $PACKAGE"
    exit 1
fi

echo ""
echo "--- Philosophy Note ---"
# Case statement: prints a one-line philosophy note per package name
case $PACKAGE in
    python3)
        echo "Python: A language shaped entirely by its community."
        echo "        From Guido's 1989 holiday project to the backbone"
        echo "        of modern AI — open source made this possible." ;;
    apache2)
        echo "Apache: The web server that built the open internet." ;;
    mysql-server)
        echo "MySQL: Open-source at heart, with a dual-license story." ;;
    vlc)
        echo "VLC: Born in a French university, plays anything anywhere." ;;
    *)
        echo "$PACKAGE: An open-source tool contributing to the digital commons." ;;
esac

echo ""
echo "=============================="
