#! /usr/bin/python

import numpy as np
import rospy
import os
import math
from tf.transformations import *
from sensor_msgs.msg import JointState
from geometry_msgs.msg import PoseStamped
from testbot_lab2.srv import *
from nav_msgs.msg import Path
from testbot_lab2.srv import jint_control_srv

def to_pose_stamped(xyz):
	pose = PoseStamped()
	pose.header.frame_id = 'base_link'
	pose.header.stamp = rospy.Time.now()
	pose.pose.position.x = xyz[0]
	pose.pose.position.y = xyz[1]
	pose.pose.position.z = xyz[2]
	return pose

def to_joint_state(px,py,pz):
	global pub
	js = JointState()
	js.name.append('base_link1')
	js.name.append('link1_link2')
	js.name.append('link2_link3')
	js.header.stamp = rospy.Time.now()
	js.position.append(pz)
	js.position.append(py)
	js.position.append(px)
	pub.publish(js)

def inter_lin(time,target_pos,prev_pos):
	next_pos = prev_pos + ((target_pos-prev_pos)/(time*1.0))
	#start_time = time
	return next_pos

def cublic_lin(time,target_pos,prev_pos):
	#todo -------------------------------------------------------------------------
	#return (1- time)*prev_pos + time*target_pos + time(1-time)(a(1-time)+ b*time)
	return

def interpolation(information):
#todo check data
	global prev_x
	global prev_y
	global prev_z
	global ppub
	path = Path()
	if(information.x > 0.38) :
		return 'Wrong value - prysmatic x > 0.38'
	if( information.y > 2):
		return 'Wrong value - rotation a2 y > 2'
 	if( information.z >2 ):
		return 'Wrong value - rotation a1 z > 2'
	if(information.time <= 0):
		return 'Wrong time value:  must be greater than 0'

	if(information.type == 'linear'):
		rate = rospy.Rate(2) # rate if too fast used with rate.sleep() at the end of loop
		for i in range(10):
			px = inter_lin(information.time, information.x, prev_x)
			py = inter_lin(information.time, information.y, prev_y)
			pz = inter_lin(information.time, information.z, prev_z)	
			to_joint_state(px,py,pz)
			path.poses.append(to_pose_stamped([px, py, pz]))
			path.header.frame_id="base_link"
			ppub.publish(path)
			prev_x = px
			prev_y = py
			prev_z = pz
			rate.sleep()
		#information.status = 'ok'
		#rate.sleep()
		return 'ok-done lineary'

	elif(infrmation.type == 'cubic'):
		return 'ok'
	else:
		#information.status = 'wrong type of interpolation'
		return 'wrong type of interpolation'



if __name__ == '__main__':
	prev_x=0
	prev_y=0
	prev_z=0

	rospy.init_node('jint', anonymous=True)

	print os.path.dirname(os.path.realpath(__file__))
  
	pub = rospy.Publisher('joint_states', JointState, queue_size = 1)
	ppub = rospy.Publisher('path', Path, queue_size = 1)
	#rospy.wait_for_service('jint')
	input_data = rospy.Service('jint_control_srv', jint_control_srv, interpolation)
	to_joint_state(0,0,0)
	rospy.loginfo( 'Ready -------------service jint---------------')
	rospy.spin()

