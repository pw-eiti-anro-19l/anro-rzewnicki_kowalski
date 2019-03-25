#!/usr/bin/env python
import numpy as np


f = open("dh.txt", "r")
input = np.loadtxt("dh.txt", dtype='d', delimiter=' ')
print(input)

print(input[0][3])

print(input[1][3])

print(input[2][3])

#j[1] = open("param1.yaml","w")
#j[2] = open("param2.yaml", "w")
#j[3] = open("param3.yaml", "w")





