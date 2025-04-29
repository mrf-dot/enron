# Search for all numbers formatted like (123)456-7890
{
	# set line to the whole line as a temp variable
	line = $0
	# match all phone numbers in the line
	while (match(line, /\([0-9]{3}\)\s*-?[0-9]{3}-[0-9]{4}/)) {
		# add the phone number to the numbers array
		num = substr(line, RSTART, RLENGTH)
		gsub(/\s/, "", num)
		# if there is dash between area code and number, remove it
		if (substr(num, 6, 1) == "-") {
			num = substr(num, 1, 5) substr(num, 7)
		}
		# Insert a space between the number and area code
		num = substr(num, 1, 5) " " substr(num, 6)
		numbers[num]++
		# make the line the rest of the line
		# after the number
		line = substr(line, RSTART + RLENGTH)
	}

	# Show line progress on standard err
	if (NR % 2222 == 0)
		printf "\rProcessing line: %d", NR > "/dev/stderr"
}

END {
	# print number with number of occurences
	for (number in numbers) {
		print numbers[number], number
	}
	printf "\rProcessing line: %d\n", NR > "/dev/stderr"
}
