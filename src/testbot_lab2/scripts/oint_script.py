#! /usr/bin/python

import numpy as np
import rospy
import os
import math
from tf.transformations import *
from sensor_msgs.msg import JointState
from geometry_msgs.msg import PoseStamped
from testbot_lab2.srv import oint_control_srv
from tf.transformations import quaternion_from_euler

def to_pose_stamped(xyz,quat):
	pose = PoseStamped()
	pose.header.frame_id = 'base_link'
	pose.header.stamp = rospy.Time.now()
	pose.pose.position.x = xyz[0]
	pose.pose.position.y = xyz[1]
	pose.pose.position.z = xyz[2]
	pose.pose.orientation.x = quat[0]
	pose.pose.orientation.y = quat[1]
	pose.pose.orientation.z = quat[2]
	pose.pose.orientation.w = quat[3]
	return pose

def to_path(poseadd):
	#check path
	path.header.frame_id="base_link"
	path.poses.append(poseadd)
	return path

def inter_lin(time,target_pos,prev_pos):
	#todo -------------------------------------------------------------------------
	next_pos = prev_pos + ((target_pos-prev_pos)/(time*1.0))
	#start_time = time
	return next_pos

def cublic_lin(time,target_pos,prev_pos):
	#todo -------------------------------------------------------------------------
	#return (1- time)*prev_pos + time*target_pos + time(1-time)(a(1-time)+ b*time)
	return

def interpolation(information):
	global prev_x
	global prev_y
	global prev_z
	global prev_rx
	global prev_ry
	global prev_rz
	global ppub

	path = Path()
	if(information.time <= 0):
		return 'Wrong time value:  must be greater than 0'

	if(information.type == 'linear'):
		rate = rospy.Rate(2) # rate if too fast used with rate.sleep() at the end of loop
		for i in range(10):
			px = inter_lin(information.time, information.x, prev_x)
			py = inter_lin(information.time, information.y, prev_y)
			pz = inter_lin(information.time, information.z, prev_z)	
			prx = inter_lin(information.time, information.x, prev_rx)
			pry = inter_lin(information.time, information.y, prev_ry)
			prz = inter_lin(information.time, information.z, prev_rz)
	
			quat = quaternion_from_euler(prx, pry, prz)
			mypose = to_pose_stamped([px, py, pz], quat)
			mypath = to_path(mypose)

			spub.publush(mypose)
			ppub.publish(mypath)
			prev_x = px
			prev_y = py
			prev_z = pz
			prev_rx = prx
			prev_ry = pry
			prev_rz = prz
			rate.sleep()
		return 'ok-done linear'

	elif(infrmation.type == 'cubic'):
		return 'ok-not quite yet'
	else:
		#information.status = 'wrong type of interpolation'
		return 'wrong type of interpolation'




if __name__ == '__main__':
	prev_x=0
	prev_y=0
	prev_z=0
	prev_rx =0
	prev_ry = 0
	prev_rz = 0

	rospy.init_node('oint', anonymous=True)
  
	spub = rospy.Publisher('pose_stamped', PoseStamped, queue_size = 1)
	ppub = rospy.Publisher('path', Path, queue_size = 1)
	input_data = rospy.Service('oint_control_srv', oint_control_srv, interpolation)
	rospy.loginfo( 'Ready -------------service oint---------------')
	rospy.spin()

