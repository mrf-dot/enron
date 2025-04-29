# Rank the area codes in the dataset
{
	# Get sum of all area codes
	# areacodes[substr($2, 2, 3)]++

	# or count total occurence of
	# area codes by accounting for duplicates
	# (eg if a phone number with area code
	# 123 occurs 3 times, add 3 to the count
	# rather than just 1
	areacodes[substr($2, 2, 3)] += $1
}

END {
	for (areacode in areacodes) {
		print areacodes[areacode], areacode
	}
}
