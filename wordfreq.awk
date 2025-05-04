# Get the frequency of each word in the file (displayed in order)
# Optional: only count words in the first 1000 lines
# NR > 1000000 { exit }
{
	# loop through every word in the line
	for (i = 1; i <= NF; i++) {
		# Add lowercase word to the array with its frequency
		freq[tolower($i)]++
	}

	# Show line progress on standard err
	if (NR % 2222 == 0)
		printf "\rProcessing line: %d", NR > "/dev/stderr"
}

END {
	# define banned words
	# add another banned word by adding another | and then the word
	# ie to add the word "or" do:
	# 	banned = "^(a|the|and|or)$"
	banned = "^(a|the|and|20)$"

	# loop through every word in the frequency associative array
	for (word in freq)
		# Ensure that word is not in the banned list
		if (word !~ banned)
			# print frequency of word and word for each word
			print freq[word], word | "sort -nr"
	printf "\rProcessing line: %d\n", NR > "/dev/stderr"
}
