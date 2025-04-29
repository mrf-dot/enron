#!/bin/sh
lines=$(wc -l < emails.csv)
echo "Filtering the email CSV file for phone numbers... (operating on $lines lines)"
awk -f  extract-phone-numbers emails.csv | sort -nr > phone-numbers.txt
lines=$(wc -l < phone-numbers.txt)
echo "Computing the frequencies... (operating on $lines lines)"
awk -f area-code-ranks.awk phone-numbers.txt | sort -nr > ranked-area-codes.txt
lines=10
printf 'Outputting the top %d area codes... (operating on %d lines)\n\n' "$lines" "$lines"
awk -f top-ten-area-codes.awk ranked-area-codes.txt
printf '\nFull phone number ranks in ranked-area-codes.txt and full phone number list in phone-numbers.txt\n'
