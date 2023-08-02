import datetime
import random
import time


def output_example(output_datetime, description):
	print("Outputting:", description)
	print("  ", output_datetime)
	print("  ", output_datetime.strftime("%B"))
	print("  ", output_datetime.strftime("%d-%b-%Y %H:%M:%S"))


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
