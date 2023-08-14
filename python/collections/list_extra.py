from packaging.version import parse as parseVersion


def collection_display(collection_name, example_collection):
	print("Processing:", collection_name, example_collection)


version_list = ["1.0.0", "1.1.0", "1.2.0", "1.17.0"]
collection_display("Version List 1", version_list)
version_list.sort()
collection_display("Version List 2", version_list)
version_list.sort(reverse=True)
collection_display("Version List 3", version_list)

# distutils is deprecated and will be removed in 3.12, so this is the way forward
# however it requires the packaging package, which is installed as follows:
#   pip install packaging
version_list.sort(reverse=True, key = parseVersion)
collection_display("Version List 4", version_list)
