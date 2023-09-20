import platform
import subprocess
import sys

print("Current Python interpreter is [%s]" % (sys.executable))
print("Python Version (base):  %s.%s.%s" % sys.version_info[:3])
print("Python Version (extra): %s.%s.%s %s %s" % (sys.version_info.major, sys.version_info.minor, sys.version_info.micro, sys.version_info.releaselevel, sys.version_info.serial))
# Examples of what the following line produces:
#   Release 3.11.4        = sys.version_info(major=3, minor=11, micro=4, releaselevel='final', serial=0)
#   Release 3.12.0 beta 4 = sys.version_info(major=3, minor=12, micro=0, releaselevel='beta', serial=4)
print("Python Version (tuple):", (sys.version_info))
print("Python Version (full):  %s" % (sys.version))

# A quick and easy alternative
print("Python version: %s" % (platform.python_version()))

# Get list of installed packages via pip (supported technique)
print("Installed package details")
subprocess.check_call([sys.executable, "-m", "pip", "list"])
