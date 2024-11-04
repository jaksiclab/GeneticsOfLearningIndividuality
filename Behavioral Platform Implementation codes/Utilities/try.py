import sys
import os

curr_wd = os.getcwd()
utilities_wd = curr_wd.replace(curr_wd.split("/")[-1], "Utilities")
sys.path.insert(1, utilities_wd)

import LCD
