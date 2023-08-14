# see https://docs.python.org/3/tutorial/datastructures.html

# A dict or dictionary is made up of key/value pairs

def collection_display(collection_name, example_collection):
	print("Processing:", collection_name, example_collection)


example_dict  = {6:"Six", 7:"Seven", 8:"Eight", 9:"Nine"}

collection_display("Dictionary 1", example_dict)
# add two items
example_dict[10] = "Ten"
example_dict.update({5: "Five"})
collection_display("Dictionary 2", example_dict)
# remove an item, but the value is returned
print("Deleted value:", example_dict.pop(6))
collection_display("Dictionary 3", example_dict)

# these methods produce a list of variables or tuples in the case of items()
print("Keys:", type(example_dict.keys()), example_dict.keys())
print("Values:", type(example_dict.values()), example_dict.values())
print("Items:", type(example_dict.items()), example_dict.items())

# Calling the sorted() function gives a list of the keys in order, hence you need to lookup the values
print(sorted(example_dict))
for item in sorted(example_dict, reverse=True):
	print("{} = {} {}".format(item, example_dict.get(item), example_dict[item]))

# sort dictionary by key
example_sorted = sorted(example_dict.items())  # list of tuples from dict
print("Items:", example_sorted)
print(type(example_sorted))
for item in example_sorted:
	print("{} = {}".format(item[0], item[1]))

# sort dictionary by value
example_sorted_2 = sorted(example_dict.items(), key=lambda item: item[1])  # lambda used to get to value rather than key
print("Items:", example_sorted_2)
print(type(example_sorted_2))
for item in example_sorted_2:
	print("{} = {}".format(item[0], item[1]))
