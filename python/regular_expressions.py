import re

# Read https://docs.python.org/3/library/re.html for details on regular expressions in Python. There is an advantage to compiling before repeated use,
# however it is worth noting that this is lessened somewhat because re.match() does cache compilations.


# match only the digits 0 to 9 or a full stop . nothing else, but also match the whole string, not part of it
#          ^          match the start of the text
#           [    ]    match any character between the square brackets
#            0-9      match any digit
#               .     match a full stop
#                 *   match the previous set zero or more times
#                  $ match the end of the text
PATTERN = '^[0-9.]*$'

example_strings = ['7.2.3', '0.1.5', '21.12.beta', '21.21.epic_feature', '56578.....7856785678....562785678568....7', 'a', '-', '.', '7', '']

# loop over the example strings and see which ones match the regular expression
print('First Pass')
print('==========')
for test in example_strings:
	print('Testing "' + test + '"...')
	result = re.match(PATTERN, test) # returns None or a match object
	if result:
		print('  search success - ', result, ' ~~ ')
	else:
		print('  search failed')

# loop again, but this time compile the regular expression
print('Second Pass')
print('===========')
p = re.compile(PATTERN)
for test in example_strings:
	if p.match(test):
		print('Success - ' + test)
	else:
		print('Fail - ' + test)
