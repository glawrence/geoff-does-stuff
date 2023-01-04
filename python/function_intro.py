# Start with a polite message, as an example, however, my preference is to define functions first
print("Here we go....")

# this function works with the input variable
def do_some_maths(my_local_variable):
	if my_local_variable > 500:
		print("{0} is over 500".format(my_local_variable))
	else:
		print("{0} is 500 or less".format(my_local_variable))

# this function returns a string message
def is_over_fivehundred(input_num):
	if input_num > 500:
		return "over five hundred"
	elif input_num == 500:
		return "exactly five hundred"
	else:
		return "less than five hundred"

# this version of the function returns a Python tuple, specifically multiple variables
# See https://docs.python.org/3/library/stdtypes.html?highlight=tuple#tuples
def is_over_one_thousand(input_num):
	if input_num > 1000:
		return "over one thousand", input_num
	elif input_num == 1000:
		return "exactly one thousand", input_num
	else:
		return "less than one thousand", input_num

# this method shows an example of how to give a parameter a default value, which can be very useful
def is_over(input_num, limit_num=1000):
	if input_num > limit_num:
		return "{} is over limit of {}".format(input_num, limit_num), input_num, limit_num
	elif input_num == limit_num:
		return "{} is exactly limit of {}".format(input_num, limit_num), input_num, limit_num
	else:
		return "{} is less than limit of {}".format(input_num, limit_num), input_num, limit_num



do_some_maths(495)
do_some_maths(500)
do_some_maths(505)

print("The number is " + is_over_fivehundred(495))
print("The number is " + is_over_fivehundred(500))
print("The number is " + is_over_fivehundred(505))

# note how the tuple can be printed, or individual parts accessed
print("The number is ", is_over_one_thousand(995))
print("The number {0} is {1}".format(is_over_one_thousand(1000)[1], is_over_one_thousand(1000)[0]))
print("The number {1} is {0}".format(is_over_one_thousand(1005)[0], is_over_one_thousand(1005)[1]))

# some examples of how to call a method that has a default value, both overriding the default and using it
print("The limit test result is", is_over(95, 100))
print("The limit test result is", is_over(100, 100))
print("The limit test result is", is_over(105, 100))
print("The limit test result is", is_over(995))
print("The limit test result is", is_over(1000))
print("The limit test result is", is_over(1005))
