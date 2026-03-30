#!/bin/bash
# Script 1: System Identity Report
# Author: [Your Name] | Course: Open Source Software
# Purpose: Display a welcome screen with system identity information
#          and note the open-source license covering the OS.

# --- Variables: store student and software choice ---
STUDENT_NAME="[Your Name]"
SOFTWARE_CHOICE="Python"

# --- Gather system information using command substitution $() ---
KERNEL=$(uname -r)
USER_NAME=$(whoami)
HOME_DIR=$(echo $HOME)
DISTRO=$(lsb_release -d 2>/dev/null | cut -f2 || grep PRETTY_NAME /etc/os-release | cut -d'"' -f2)
UPTIME=$(uptime -p)
CURRENT_DATE=$(date '+%A, %d %B %Y %H:%M:%S')

# --- Display the identity report ---
echo "============================================="
echo "  Open Source Audit — System Identity Report"
echo "  Student: $STUDENT_NAME"
echo "  Software Choice: $SOFTWARE_CHOICE"
echo "============================================="
echo ""
echo "  Distribution : $DISTRO"
echo "  Kernel       : $KERNEL"
echo "  User         : $USER_NAME"
echo "  Home Dir     : $HOME_DIR"
echo "  Uptime       : $UPTIME"
echo "  Date/Time    : $CURRENT_DATE"
echo ""
echo "  License Note : The Linux OS is covered by the GNU General"
echo "                 Public License v2 (GPL v2). This means the"
echo "                 source code is freely available, modifiable,"
echo "                 and redistributable — a legal guarantee of"
echo "                 openness that protects every user on this system."
echo "============================================="
