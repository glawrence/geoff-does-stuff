# see https://docs.python.org/3/tutorial/datastructures.html

def collection_display(collection_name, example_collection):
	print("Processing:", collection_name, example_collection)


number_list = [1, 3, 5, 7, 9]
word_list    = ["One", "Three", "Five", "Seven", "Nine"]

collection_display("List 1", number_list)
number_list.append(6)
collection_display("List 2", number_list)
number_list.sort(reverse=True)
collection_display("List 3", number_list)
number_list.remove(1)
collection_display("List 4", number_list)

collection_display("Original Order ", word_list)
word_list.sort()
collection_display("Alphabetical   ", word_list)
word_list.sort(key=lambda item: item[2])  # sort by third character (zero indexed)
collection_display("Third Character", word_list)
word_list.sort(reverse=True, key=lambda item: item[2])  # sort by third character (zero indexed)
collection_display("Reverse third  ", word_list)  # note "Five" and "Seven" are equal
