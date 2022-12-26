import sys

print("Current Python interpreter is [%s]" % (sys.executable))
print("Python Version (base):  %s.%s.%s" % sys.version_info[:3])
print("Python Version (extra): %s.%s.%s %s %s" % (sys.version_info.major, sys.version_info.minor, sys.version_info.micro, sys.version_info.releaselevel, sys.version_info.serial))
print("Python Version (tuple):", (sys.version_info))
print("Python Version (full):  %s" % (sys.version))

# A quick and easy alternative
import platform
print("Python version: %s" % (platform.python_version()))
