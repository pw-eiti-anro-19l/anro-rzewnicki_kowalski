#! /usr/bin/python

import  numpy as np
import rospy
import os
import math
from tf.transformations import *
from sensor_msgs.msg import JointState
from geometry_msgs.msg import PoseStamped


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

def inter_lin(time,target_pos,prev_pos):
	next_pos = prev_pos + ((target_pos-prev_pos)/(time*10.0))
	#start_time = time
	return next_pos


def interpolation(information):
#todo check data
	if(information.x > 100 or information.y >100 or information.z >100):
		information.status = 'Wrong values'
		return
	if(information.time <= 0):
		information.status = 'Wrong time value'
		return

	if(information.type == 'linear'):
 

		rate = rospy.Rate(10) # rate if too fast used with rate.sleep() at the end of loop
		for i in range(10):
			px = inter_lin(information.time, information.x, prev_x)
			py = inter_lin(information.time, information.y, prev_y)
			pz = inter_lin(information.time, information.z, prev_z)	
			to_joint_state(px,py,pz)

		prev_x = px
		prev_y = py
		prev_z = pz
		information.status = 'ok'
		return

	elif(infrmation.type == 'poly'):
		return
	else:
		information.status = 'wrong type of interpolation'
		return



if __name__ == '__main__':
	prev_x=0
	prev_y=0
	prev_z=0

	rospy.init_node('jint', anonymous=True)

	print os.path.dirname(os.path.realpath(__file__))
  
	pub = rospy.Publisher('jointState', JointState, queue_size = 10)
	rospy.wait_for_service('Jint')
	input_data = rospy.Service('jint', Jint , interpolation)
	rospy.spin()

