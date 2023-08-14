# https://docs.python.org/3/library/stdtypes.html#string-methods

input_text_ip = '192.168.21.12:404'
input_text_msg = "This is how Geoff Does Stuff"

print("Text:", input_text_ip)
# the split() function of a string returns a list of strings
print("Split:", input_text_ip.split('.'))
# you can limit how many split characters are used, 2 means make 2 good splits and then return a third item with everything else
print("Split:", input_text_ip.split('.', 2))
# if you just want the first part
print("Split:", input_text_ip.split('.', 2)[0])
# you can also get the last element in the list with a "-1"
print("Split:", input_text_ip.split('.', 2)[-1])

# partition is a useful alternative, it returns a tuple of strings, three strings, where the second is the separator specified
print("Partition:", input_text_ip.partition('.'))

print("Lowercase:", input_text_msg.lower())
print("Uppercase:", input_text_msg.upper())
# capitalise the first letter
print("Capitalise:", input_text_msg.capitalize())
# capitalise the first letter of every word
print("Title:", input_text_msg.title())
print("Find:", input_text_msg.find("Geoff"))
# if the text cannot be found, -1 is returned
print("Find:", input_text_msg.find("John"))
print("Replace:", input_text_msg.replace("Geoff", "Dave"))

if input_text_msg.startswith("this"):
	print("Starts with this")
if input_text_msg.startswith("This"):
	print("Starts with: This")
if input_text_msg.endswith("Stuff"):
	print("Ends with: Stuff")
