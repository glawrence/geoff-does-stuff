# https://docs.python.org/3/library/exceptions.html
# https://docs.python.org/3/library/exceptions.html#BaseException

x = 10
y = 0 # try changing this to a non-zero number

try:
	print(x/y)
except ZeroDivisionError as zde:
	print("A ZeroDivisionError exception has occured..")
	print("  Arguments passed to exception constructor:", zde.args)
	print("  Exception class:", zde.__class__)
	print("  Exception object as string:", zde)
	if str(zde) == 'division by zero':
		print("  String matched 'division by zero'")
	if type(zde) == ZeroDivisionError:
		print("  Class matched ZeroDivisionError")
else:
	print("No exceptions!")
finally:
	print("The end")

try:
	import re
	import packaging
except ModuleNotFoundError as mnfe:
	print("The following module needs to be installed with 'pip' or equivalent:", mnfe.name)

print("Done.")
