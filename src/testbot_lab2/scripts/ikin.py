#! /usr/bin/python

import numpy as np
import rospy
import os
import math
from tf.transformations import *
from sensor_msgs.msg import JointState
from geometry_msgs.msg import PoseStamped
from testbot_lab2.srv import myjint



def to_joint_state(px,py,pz):
	js = JointState()
	js.name.append('joint1')
	js.name.append('joint2')
	js.name.append('joint3')
	js.position.resize(3)
	js.header.stamp = rospy.Time.now()
	js.position[0] = px
	js.position[1] = py
	js.position[2] = pz
	joint.publish(js)


def interpolation(information):




if __name__ == '__main__':


	rospy.init_node('ikin', anonymous=True)

	print os.path.dirname(os.path.realpath(__file__))
  
	pub = rospy.Publisher('jointState', JointState, queue_size = 10)
	rospy.wait_for_service('myjint')
	input_data = rospy.Service('jint_service', myjint , interpolation)
	rospy.spin()

