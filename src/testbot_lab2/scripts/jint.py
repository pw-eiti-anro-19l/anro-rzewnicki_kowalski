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
	next_pos=prev_pos+((target_pos-prev_pos)/(time - start_time))*(time_const-start_time))
	start_time=time
	return next_pos


def interpolation(information,prev_pos):
#todo check data
prev_x=inter_lin(information.time, information.x, prev_x)
prev_y=inter_lin(information.time, information.y, prev_y)
prev_z=inter_lin(information.time, information.z, prev_z)









if __name__ == '__main__':
	prev_x=0
	prev_y=0
	prev_z=0

	start_time

	rospy.init_node('jint', anonymous=True)

    print os.path.dirname(os.path.realpath(__file__))
  
    pub = rospy.Publisher('jointState', JointState, queue_size = 10)
    input_data = rospy.Service('input', Input_srv, interpolation)

    rospy.spin()

