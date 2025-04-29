# Text rules to filter the file
# First column ends with a colon (metadata)
$1 ~ /:$/ ||
   # Line only contains quotation marks
   $0 ~ /^\s*"+\s*$/ ||
   # Line is blank
   $0 ~ /^\s*$/ ||
   # Line starts with a > (reply text)
   $1 ~ /^>/ ||
   # Line only contains asterisks (junk)
   $0 ~ /^\*+$/ ||
   # Line contains only underscores (junk)
   $0 ~ /^_+/ ||
   # Line only contains dashes (metadata)
   $1 ~ /^-+/ ||
   # Filter out first line
   # Skip the line if one or more of the above criteria is met
   NR == 1 {next}

# print all lines that don't fall into the criteria
{
	# filter out all websites (words starting with http(s)://
	# and emails (words like abc@xyz.com)
	gsub(/(https?:\/\/\S+)|(\S+@\S+\.\S+)/, "")
	# filter out extra whitespace
	gsub(/[[:punct:]]/, " ")
	# Filter out all whitespace
    	gsub (/\s+/, " ")
    # print teh line if it is not just whitespace
    	if ($0 !~ /^\s*$/) print
}
