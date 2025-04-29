#!/bin/sh
lines=$(wc -l < emails.csv)
echo "Filtering the email CSV file... (operating on $lines lines)"
awk -f filter-email-csv.awk emails.csv > filtered-emails.txt
lines=$(wc -l < filtered-emails.txt)
echo "Computing the frequencies... (operating on $lines lines)"
awk -f wordfreq.awk filtered-emails.txt | sort -nr > email-word-frequencies.txt
lines=10
printf 'Outputting the top %d word frequencies... (operating on %d lines)\n\n' "$lines" "$lines"
awk -f top-ten.awk email-word-frequencies.txt
printf '\nFull email word frequencies are in email-word-frequencies.txt\n'
