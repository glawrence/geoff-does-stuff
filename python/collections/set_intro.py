# see https://docs.python.org/3/library/stdtypes.html#set


def collection_display(collection_name, example_collection):
	print("Processing:", collection_name, example_collection)
	print(" Collection Type:", type(example_collection))


low_nums_set  = {1, 2, 3, 4, 5}
high_nums_set = {6, 7, 8, 9, 10}
even_nums_set = {2, 4, 6, 8, 10}
odds_nums_set = {1, 3, 5, 7, 9}

collection_display("Set", low_nums_set)
# if you insist on sorting a set, you will get a list!
collection_display("Sorted", sorted(low_nums_set))
print("Not odd:", low_nums_set.difference(odds_nums_set))
print("Not even:", low_nums_set.difference(even_nums_set))
print("Odd:", low_nums_set.intersection(odds_nums_set))
print("Even:", low_nums_set.intersection(even_nums_set))
print("All:", low_nums_set.union(high_nums_set).union(odds_nums_set).union(even_nums_set))