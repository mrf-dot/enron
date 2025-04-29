# Print column headers
BEGIN { printf "%-10s %-10s %-10s\n", "Rank:", "Code:", "Frequency:" }

# Exit if the number of rows is greater than 10
NR > 10 { exit 0 }

# Print the formatted entry
{ printf "%-10s %-10s %-10s\n", addcomma(NR),  $2 , addcomma($1) }

# Add commas to a string to format it like a number
function addcomma(x,	num) {
	num = sprintf(x)
	len = length(num)
	for (i = len - 3; i > 0; i -= 3)
		num = substr(num, 1, i) "," substr(num, i+1)
	return num
}
