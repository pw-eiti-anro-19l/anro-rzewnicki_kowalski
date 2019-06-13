#! /usr/bin/python

import numpy as np
import rospy
import os
import sys
from tf.transformations import *
from testbot_lab2.srv import oint_control_srv







if __name__ == '__main__':
	rospy.init_node('oint_cmd', anonymous=True)

	while not rospy.is_shutdown():
		rospy.wait_for_service('oint_control_srv')
		try:
			oint = rospy.ServiceProxy('oint_control_srv', oint_control_srv)
			x = float(input('x: '))
			y = float(input('y: '))
			z = float(input('z: '))
			t = float(input('time: '))
			type_ = raw_input('type: ')
			resp = oint(x,y,z,0,0,0,t,type_)
			rospy.loginfo( resp.status)
		except rospy.ServiceException, e:
			print "Service call failed: %s"%e


