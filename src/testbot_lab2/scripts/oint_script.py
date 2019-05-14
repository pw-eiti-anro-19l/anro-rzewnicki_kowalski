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
from nav_msgs.msg import Path

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

def to_path(poseadd,path):
	path.header.frame_id="base_link"
	path.poses.append(poseadd)
	return path

def inter_lin(bits, target_pos, prev_pos, start_pos):
	return (prev_pos + ((target_pos-start_pos)/bits))


def time_ctrl(start_pos,target_pos,prev_pos,acc):
	global pperiod
	distance=abs(prev_pos-target_pos)
	total_distance=abs(target_pos-start_pos)	
	acc=acc*0.1
	if(distance>total_distance/2):
		pperiod=(pperiod/(1+(acc*pperiod)))
		if(pperiod<=0.0001):
			return 1000
		else:
			return int(1/pperiod)
	else:
		pperiod=pperiod/(1-(acc*pperiod))
		if(pperiod>0.1):
			return 10
		elif(pperiod <=0.0001):
			return 1000
		else:
			return int(1/pperiod)
			

def interpolation(information):
	global prev_x
	global prev_y
	global prev_z
	global prev_rx
	global prev_ry
	global prev_rz
	global start_pos_x
	global start_pos_y
	global start_pos_z
	global start_pos_rx
	global start_pos_ry
	global start_pos_rz
	global ppub
	global spub

	path = Path()
	if(information.time <= 0):
		return 'Wrong time value:  must be greater than 0'

	if(information.type == 'linear'):
		samples=information.time*60
		#information.z=information.z-3.14
		#information.y=information.y-3.14
		rate = rospy.Rate(60) # rate if too fast used with rate.sleep() at the end of loop
		for i in range(int(samples)):
			rospy.loginfo( 'information')
			rospy.loginfo( [information.x, information.y, information.z])
			px = inter_lin((int(information.time*60)-1), information.x, prev_x,start_pos_x)
			py = inter_lin((int(information.time*60)-1), information.y, prev_y,start_pos_y)
			pz = inter_lin((int(information.time*60)-1), information.z, prev_z,start_pos_z)
			rospy.loginfo( [px, py , pz])
			prx = inter_lin(information.time, information.rx, prev_rx,start_pos_rx)
			pry = inter_lin(information.time, information.ry, prev_ry,start_pos_ry)
			prz = inter_lin(information.time, information.rz, prev_rz,start_pos_rz)
	
			quat = quaternion_from_euler(prx, pry, prz)
			mypose = to_pose_stamped([px, py, pz], quat)
			mypath = to_path(mypose,path)

			spub.publish(mypose)
			ppub.publish(mypath)
			prev_x = px
			prev_y = py
			prev_z = pz
			prev_rx = prx
			prev_ry = pry
			prev_rz = prz
			rate.sleep()
		start_pos_x=prev_x
		start_pos_y=prev_y
		start_pos_z=prev_z
		start_pos_rx=prev_rx
		start_pos_ry=prev_ry
		start_pos_rz=prev_rz
		return 'ok-done linear'

	elif(information.type == 'cubic'):
		#information.z=information.z-1.57
		#information.y=information.y-1.57

		samples=abs(information.y-start_pos_y)*1000
		rate = rospy.Rate(60) # rate if too fast used with rate.sleep() at the end of loop
		
		for i in range(int(samples)):
			px = inter_lin(samples, information.x, prev_x,start_pos_x)
			py = inter_lin(samples, information.y, prev_y,start_pos_y)
			pz = inter_lin(samples, information.z, prev_z,start_pos_z)

			prx = inter_lin(information.time, information.rx, prev_rx,start_pos_rx)
			pry = inter_lin(information.time, information.ry, prev_ry,start_pos_ry)
			prz = inter_lin(information.time, information.rz, prev_rz,start_pos_rz)

			rate=rospy.Rate(time_ctrl(0, samples, i, information.time))	

			quat = quaternion_from_euler(prx, pry, prz)
			mypose = to_pose_stamped([px, py, pz], quat)
			mypath = to_path(mypose,path)

			spub.publish(mypose)
			ppub.publish(mypath)

			prev_x = px
			prev_y = py
			prev_z = pz
			prev_rx = prx
			prev_ry = pry
			prev_rz = prz
			#rospy.loginfo(int(1/pperiod))
			rate.sleep()

		start_pos_x=prev_x
		start_pos_y=prev_y
		start_pos_z=prev_z
		start_pos_rx=prev_rx
		start_pos_ry=prev_ry
		start_pos_rz=prev_rz
		return 'ok'
	else:
		return 'wrong type of interpolation'




if __name__ == '__main__':
	prev_x=0.3
	prev_y=0
	prev_z=0.2
	prev_rx=0
	prev_ry=0
	prev_rz=0
	pperiod=0.1
	start_pos_x=0.3
	start_pos_y=0
	start_pos_z=0.2
	start_pos_rx=0
	start_pos_ry=0
	start_pos_rz=0
	rospy.init_node('oint', anonymous=True)
  
	spub = rospy.Publisher('pose_stamped', PoseStamped, queue_size = 1)
	ppub = rospy.Publisher('path', Path, queue_size = 1)
	input_data = rospy.Service('oint_control_srv', oint_control_srv, interpolation)
	rospy.loginfo( 'Ready -------------service oint---------------')
	rospy.spin()

