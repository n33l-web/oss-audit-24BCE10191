#!/bin/bash
# Script 5: The Open Source Manifesto Generator
# Author: [Your Name] | Course: Open Source Software
# Purpose: Interactively generate a personalised open-source philosophy
#          statement and save it to a .txt file.

echo "======================================"
echo "  Open Source Manifesto Generator"
echo "======================================"
echo ""
echo "Answer three questions to generate your personal open-source manifesto."
echo ""

read -p "1. Name one open-source tool you use every day: " TOOL
read -p "2. In one word, what does 'freedom' mean to you in computing? " FREEDOM
read -p "3. Name one thing you would build and share freely with the world: " BUILD

DATE=$(date '+%d %B %Y')
TIMESTAMP=$(date '+%Y%m%d_%H%M%S')
OUTPUT="manifesto_$(whoami)_${TIMESTAMP}.txt"

echo ""
echo "Generating your manifesto..."
echo ""

echo "============================================" > "$OUTPUT"
echo "  MY OPEN SOURCE MANIFESTO" >> "$OUTPUT"
echo "  Generated on: $DATE" >> "$OUTPUT"
echo "  Author: $(whoami)" >> "$OUTPUT"
echo "============================================" >> "$OUTPUT"
echo "" >> "$OUTPUT"
echo "I believe in open source because I have seen what it builds." >> "$OUTPUT"
echo "" >> "$OUTPUT"

PARAGRAPH="Every day, I rely on $TOOL — a tool I did not pay for, "
PARAGRAPH+="built by people I have never met, made possible because "
PARAGRAPH+="someone chose to share their work rather than lock it away. "
PARAGRAPH+="To me, freedom in computing means $FREEDOM. "
PARAGRAPH+="That freedom is not just an idea — it is enforced by "
PARAGRAPH+="the licenses that say: you can read this, you can change this, "
PARAGRAPH+="you can share this. "
PARAGRAPH+="One day, I will contribute back: I will build $BUILD "
PARAGRAPH+="and release it openly, because I stand on the shoulders of "
PARAGRAPH+="the people who built what I use today."

echo "$PARAGRAPH" >> "$OUTPUT"
echo "" >> "$OUTPUT"
echo "Signed: $(whoami)" >> "$OUTPUT"
echo "Date  : $DATE" >> "$OUTPUT"
echo "============================================" >> "$OUTPUT"

echo "--- Your Manifesto ---"
cat "$OUTPUT"
echo ""
echo "Saved to: $OUTPUT"

# Alias concept note:
# Add to ~/.bashrc: alias manifesto='bash ~/script5.sh'
# Then simply type 'manifesto' to run it.
