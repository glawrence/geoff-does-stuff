# The idea behind this file is to introduce and explain some basic Python concepts and ways of working.

# First, let's import a standard module, with library code that we will then use
import math

# With Python 3 onwards we should be using print as a function
print("Hello World")
print('Hello World')
print("""This is
how you can
do multi-line text""")
print("""You can put things in "double" quotes when using trebble doubles like this""")

# by convention upper case variables are "constant", this is not enforced by the language but simply by developer naming convention
MY_CONSTANT = 42
my_variable = 42

# using the math library, output the value of Pi
print(math.pi)

# store the value of Pi in a variable, note the variable uses lowercase and underscores
value_of_pi = math.pi

# demonstration of outputting text and variables
print("Pi: " + str(value_of_pi)) # we need str() because Pi is a float
print("Pi:", value_of_pi) # note how using a comma fixes the type issue, but adds a space character
print("Pi: {0}".format(value_of_pi)) # this technique allows greater control
print("Pi: {0:.5}".format(value_of_pi)) # we can also round

# you can identify variables by letter rather than number and use them more than once
print("The value of {t} is {v}, which can be abbreviated to {v:.3f}".format(v=value_of_pi, t="Pi"))
print(f"The value of Pi is {value_of_pi}, which can be abbreviated to {value_of_pi:.3f}")
print(f"Hello, {math.sqrt(9)}! How are you?")

# the string formatting options are useful and worth reading about
print("Decimal: {0}, Hexadecimal: {0:#X}".format(20))
print("Decimal: {0}, Hexadecimal: {0:#X}".format(16))
