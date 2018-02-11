#!/usr/bin/env python

import os

commitMessage = raw_input("input site source commit message:\n")
os.system(r'git commit -m "' + commitMessage + r'"')
