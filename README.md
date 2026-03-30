# Open-Source Software — VITyarthi Project
## Bash Scripting Suite on Linux (Python & Shell Utilities)

---

| Field               | Details                              |
|---------------------|--------------------------------------|
| **Student Name**    | Neel Sharma                          |
| **Roll Number**     | 24BCE10191                           |
| **Course**          | Open-Source Software                 |
| **Slot**            | D11                                  |
| **Date**            | 30/03/2026                           |
| **Platform**        | Linux (Ubuntu 22.04 LTS)             |

---

## Table of Contents

1. [About the Chosen Software](#about-the-chosen-software)
2. [Script Descriptions](#script-descriptions)
   - [Script 1 — System Identity Report](#script-1--system-identity-report)
   - [Script 2 — FOSS Package Inspector](#script-2--foss-package-inspector)
   - [Script 3 — Disk and Permission Auditor](#script-3--disk-and-permission-auditor)
   - [Script 4 — Log File Analyzer](#script-4--log-file-analyzer)
   - [Script 5 — Open-Source Manifesto Generator](#script-5--open-source-manifesto-generator)
3. [Dependencies](#dependencies)
4. [Step-by-Step Instructions to Run Each Script on Linux](#step-by-step-instructions-to-run-each-script-on-linux)
5. [Summary Table](#summary-table)

---

## About the Chosen Software

**Python Programming Language 3.x** is an open-source, general-purpose, high-level programming language created by **Guido van Rossum** in 1989 and first publicly released in February 1991. It was designed to bridge the gap between complex compiled languages (C/C++) and limited scripting tools — prioritising readability, extensibility, and practical utility.

Python is distributed under the **Python Software Foundation License (PSF) v2** — a permissive open-source license approved by the OSI and FSF. It grants users full freedom to use, study, modify, and redistribute Python, including for commercial purposes, without any copyleft obligation.

Python's open-source nature is what enabled its enormous ecosystem: **NumPy, Django, TensorFlow, PyTorch, Pandas, Jupyter**, and thousands more libraries exist because the language itself imposes no legal barriers to building on top of it.

---

## Script Descriptions

### Script 1 — System Identity Report

**Filename:** `script1.sh`

**Purpose:**
Displays a welcome screen that collects and prints live system identity information — including kernel version, Linux distribution name, current user, system uptime, and date/time. It also notes that the Linux kernel is covered under the GNU GPL v2 license, connecting the script to open-source ethics.

**Key Concepts Demonstrated:**
- Command substitution using `$(...)` to capture live output
- Variable assignment and usage
- `echo` formatting for readable output

**Core Code Snippet:**
```bash
KERNEL=$(uname -r)
DISTRO=$(lsb_release -d | cut -f2)
echo "  Kernel : $KERNEL"
echo "  License: GNU GPL v2"
```

---

### Script 2 — FOSS Package Inspector

**Filename:** `script2.sh`

**Purpose:**
Checks whether a specified FOSS package (default: `python3`) is installed on the system. If installed, it displays the package version and status using `dpkg`. It then uses a `case` statement to print a tailored philosophical note about the package.

**Key Concepts Demonstrated:**
- `dpkg` package check for installed software
- `grep -E` for filtering output by multiple patterns
- `case` statement for pattern-based branching

**Core Code Snippet:**
```bash
if dpkg -l "$PACKAGE" &>/dev/null; then
    dpkg -s "$PACKAGE" | grep -E "Version|Status"
fi

case $PACKAGE in
    python3) echo "Python: community-shaped." ;;
esac
```

---

### Script 3 — Disk and Permission Auditor

**Filename:** `script3.sh`

**Purpose:**
Audits a predefined set of key Linux directories (`/etc`, `/var/log`, `/home`, `/usr/bin`) for disk usage and file permission details. Outputs all findings in a neatly formatted table showing directory path, permissions, owner, group, and size.

**Key Concepts Demonstrated:**
- `for` loop iterating over a Bash array
- `ls -ld | awk` to extract permission and ownership fields
- `du -sh` for human-readable directory size
- `find | wc -l` for counting files
- `printf` for formatted tabular output

**Core Code Snippet:**
```bash
DIRS=("/etc" "/var/log" "/home" "/usr/bin")

for DIR in "${DIRS[@]}"; do
    PERMS=$(ls -ld "$DIR" | awk '{print $1,$3,$4}')
    SIZE=$(du -sh "$DIR" 2>/dev/null | cut -f1)
    printf "%-30s %-20s %s\n" "$DIR" "$PERMS" "$SIZE"
done
```

---

### Script 4 — Log File Analyzer

**Filename:** `script4.sh`

**Purpose:**
Accepts a log file path and a search keyword as command-line arguments. Reads the file line-by-line, counts all lines matching the keyword (case-insensitive), accumulates matches in an array, and displays the total count along with the last 5 matching lines.

**Key Concepts Demonstrated:**
- Command-line arguments (`$1`, `$2`) with default value fallback
- `while IFS= read -r` loop for memory-efficient file processing
- Array accumulation (`+=`)
- Arithmetic with `$(( ))`

**Core Code Snippet:**
```bash
LOGFILE=$1           # path passed as argument
KEYWORD=${2:-"error"} # default keyword: "error"

while IFS= read -r LINE; do
    if echo "$LINE" | grep -iq "$KEYWORD"; then
        COUNT=$((COUNT + 1))
        MATCH_LINES+=("$LINE")
    fi
done < "$LOGFILE"
```

---

### Script 5 — Open-Source Manifesto Generator

**Filename:** `script5.sh`

**Purpose:**
Interactively prompts the user for personal information (name, favourite FOSS tool, programming language, and a personal open-source belief). It then assembles these inputs into a personalised open-source philosophy statement and saves it to a timestamped `.txt` file. Also demonstrates the Bash alias concept for easy re-use.

**Key Concepts Demonstrated:**
- `read -p` for interactive inline user input
- String concatenation and interpolation
- File output redirection with `>>`
- Timestamped filenames using `$(date ...)`
- Bash alias concept for `~/.bashrc` integration

**Core Code Snippet:**
```bash
read -p "1. One open-source tool you use: " TOOL
OUTPUT="manifesto_$(whoami)_${TIMESTAMP}.txt"
echo "Every day, I rely on $TOOL..." >> "$OUTPUT"

# Alias suggestion — add to ~/.bashrc:
# alias manifesto='bash ~/script5.sh'
```

---

## Dependencies

All scripts are written in **Bash** and use only standard POSIX/Bash utilities available on any Debian/Ubuntu-based Linux system. No additional installation is required beyond the defaults.

| Dependency       | Used In         | Purpose                                          | Install Command (if missing)         |
|------------------|-----------------|--------------------------------------------------|--------------------------------------|
| `bash`           | All scripts     | Shell interpreter                                | Pre-installed on all Linux distros   |
| `uname`          | Script 1        | Retrieve kernel version                          | Pre-installed (`util-linux`)         |
| `lsb_release`    | Script 1        | Retrieve Linux distribution name                | `sudo apt install lsb-release`       |
| `whoami`, `uptime`, `date` | Scripts 1, 5 | User/time/uptime info                 | Pre-installed (`coreutils`)          |
| `dpkg`           | Script 2        | Check installed packages                         | Pre-installed on Debian/Ubuntu       |
| `grep`           | Scripts 2, 4    | Filter text output                               | Pre-installed (`grep`)               |
| `ls`, `du`, `find` | Script 3      | Directory info and disk usage                    | Pre-installed (`coreutils`)          |
| `awk`            | Script 3        | Field extraction from command output             | Pre-installed (`gawk`)               |
| `printf`         | Script 3        | Formatted table output                           | Bash built-in                        |
| `python3`        | Script 2 (checked) | The inspected FOSS package                   | `sudo apt install python3`           |

> **Note:** All scripts were written and tested on **Ubuntu 22.04 LTS**. They are compatible with any Debian-based distribution (Ubuntu, Linux Mint, Kali, etc.).

---

## Step-by-Step Instructions to Run Each Script on Linux

### Prerequisites

Ensure your system is up to date and Bash is available:

```bash
sudo apt update && sudo apt upgrade -y
bash --version
```

---

### General Setup (All Scripts)

**Step 1 — Create a working directory and navigate into it:**
```bash
mkdir ~/oss_scripts && cd ~/oss_scripts
```

**Step 2 — Create each script file:**
```bash
nano script1.sh   # paste Script 1 code, save with Ctrl+O, exit with Ctrl+X
nano script2.sh   # paste Script 2 code
nano script3.sh   # paste Script 3 code
nano script4.sh   # paste Script 4 code
nano script5.sh   # paste Script 5 code
```

**Step 3 — Make all scripts executable:**
```bash
chmod +x script1.sh script2.sh script3.sh script4.sh script5.sh
```

---

### Running Script 1 — System Identity Report

```bash
bash script1.sh
```

**Expected Output:** Prints a formatted welcome screen showing kernel version, distro name, current user, uptime, date/time, and the GPL v2 license note.

---

### Running Script 2 — FOSS Package Inspector

```bash
bash script2.sh
```

> The script checks for `python3` by default. To inspect a different package, edit the `PACKAGE` variable inside the script.

**Expected Output:** Shows the installation status and version of `python3`, followed by a philosophical note about the package.

**If `python3` is not installed:**
```bash
sudo apt install python3
```

---

### Running Script 3 — Disk and Permission Auditor

```bash
bash script3.sh
```

**Expected Output:** A formatted table listing `/etc`, `/var/log`, `/home`, and `/usr/bin` with their permissions, owner/group, and disk usage size.

> Some directories (like `/var/log`) may show restricted sizes without `sudo`. To get full results:
```bash
sudo bash script3.sh
```

---

### Running Script 4 — Log File Analyzer

**Step 1 — Create a sample log file for testing (if you don't have one):**
```bash
cat <<EOF > sample.log
[INFO] System started successfully
[ERROR] Failed to connect to database
[INFO] User login: neel
[ERROR] Timeout on request /api/data
[WARNING] Disk usage above 80%
[ERROR] Authentication failed for user root
EOF
```

**Step 2 — Run the script with the log file and a keyword:**
```bash
bash script4.sh sample.log error
```

**To use a different keyword (e.g., `INFO`):**
```bash
bash script4.sh sample.log INFO
```

**To use the default keyword (`error`) without specifying:**
```bash
bash script4.sh sample.log
```

**Expected Output:** Total count of matching lines and the last 5 matches printed to the terminal.

---

### Running Script 5 — Open-Source Manifesto Generator

```bash
bash script5.sh
```

**Expected Output:** The script prompts you interactively for your name, a favourite FOSS tool, your preferred programming language, and a personal open-source belief. After answering, it generates a `.txt` file named `manifesto_<username>_<timestamp>.txt` in the current directory.

**To view the generated manifesto:**
```bash
cat manifesto_*.txt
```

**Optional — Add an alias for quick access:**
```bash
echo "alias manifesto='bash ~/oss_scripts/script5.sh'" >> ~/.bashrc
source ~/.bashrc
manifesto   # runs the script from anywhere
```

---

## Summary Table

| Script   | Filename    | Core Concept                  | Output                        |
|----------|-------------|-------------------------------|-------------------------------|
| Script 1 | script1.sh  | Command substitution          | System info report            |
| Script 2 | script2.sh  | `case` statement, `dpkg`      | Package details + note        |
| Script 3 | script3.sh  | `for` loop, `awk`, `du`       | Directory audit table         |
| Script 4 | script4.sh  | `while read` loop             | Log match count + lines       |
| Script 5 | script5.sh  | `read -p`, file I/O, aliases  | Personalised `.txt` file      |

---

*All scripts are self-contained and use only standard POSIX/Bash utilities available on any Debian-based Linux distribution. Tested on Ubuntu 22.04 LTS.*

---

**— End of README —**
