# see https://docs.python.org/3/tutorial/datastructures.html


def collection_test(collection_name, example_collection):
	print("Processing:", collection_name, example_collection)
	print(" ", type(example_collection))

	if 3 in example_collection:
		print("  Number 3 found in collection")
	else:
		print("  Number 3 not in collection")

	if 6 not in example_collection:
		print("  Number 6 not in collection")
	else:
		print("  Number 6 found in collection")
		if type(example_collection) is dict:
			print("  Key 6 in dictionary has value:", example_collection[6])


example_list  = [1, 3, 5, 7, 9]
example_tuple = (2, 4, 6, 8)
example_set   = {1, 2, 3, 4, 5}
example_dict  = {6:"Six", 7:"Seven", 8:"Eight", 9:"Nine"}

collection_test("List", example_list)
collection_test("Tuple", example_tuple)
collection_test("Set", example_set)
collection_test("Dictionary", example_dict)
