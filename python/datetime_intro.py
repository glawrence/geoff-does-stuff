import datetime
import random
import time


def output_example(output_datetime, description):
	# https://docs.python.org/3/library/datetime.html#strftime-and-strptime-behavior documents what all the possible % values are
	print("Outputting:", description)
	print("  ", output_datetime)
	print("   day =", output_datetime.strftime("%d %a %A"))
	print("   month =", output_datetime.strftime("%m %b %B"))
	print("  ", output_datetime.strftime("%d-%b-%Y %H:%M:%S"))
	print("  ", output_datetime.strftime("%Y-%m-%d at %H:%M:%S"))


def pause_random_seconds():
	print("Pausing random seconds...")
	print("  starting")
	start = datetime.datetime.now()
	time.sleep(random.randint(1, 10))
	print("  done")
	end = datetime.datetime.now()
	duration = end - start # this is a timedelta
	print("  duration was", duration)


output_example(datetime.datetime.now(), "Current Date Time")

the_date = datetime.datetime(2112, 12, 21, 21, 12, 40)
output_example(the_date, "Future Example")

for i in range(1, 5):  # do this 4 times
	pause_random_seconds()
