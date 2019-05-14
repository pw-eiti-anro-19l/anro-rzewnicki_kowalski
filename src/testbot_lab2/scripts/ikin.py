#! /usr/bin/python

import numpy as np
import rospy
import os
from math import sin,acos, atan2, sqrt,pi, asin, radians
from tf.transformations import *
from sensor_msgs.msg import JointState
from geometry_msgs.msg import PoseStamped




def to_joint_state(px,py,pz):
	global pub
	js = JointState()
	js.name.append('base_link1')
	js.name.append('link1_link2')
	js.name.append('link2_link3')
	js.header.stamp = rospy.Time.now()
	js.position.append(px)
	js.position.append(py)
	js.position.append(pz)
	pub.publish(js)



def ikin_handler(information):
	x, y, z = information.pose.position.x, information.pose.position.y,  information.pose.position.z

	q3 = dh[0][1] - z
	rospy.loginfo( q3)
	c2 = ( ( x**2 + y**2 - dh[1][0]**2 - dh[2][0]**2 ) / (2*dh[1][0]*dh[2][0]) )
	if (c2 > 1):
		c2 =1
	elif (c2< -1):
		c2 = -1
	s2 = (1-(c2)**2)**0.5    #sqrt( 1 - ((c2)**2))
	q2 = acos( c2 ) 


	#s1 = (dh[2][0]*s2*x + (dh[1][0] + dh[2][0]*c2)*y)/ ( (dh[2][0]*s2)^2 + (dh[1][0] + dh[2][0]*c2)^2)
	#c1 = ((dh[1][0] + dh[2][0]*c2)*x - dh[2][0]*s2*y)/ ( (dh[2][0]*s2)^2 + (dh[1][0] + dh[2][0]*c2)^2)
	q1 = atan2((dh[2][0]*s2*x+(dh[1][0] + dh[2][0]*c2)*y), ((dh[1][0] + dh[2][0]*c2)*x - dh[2][0]*s2*y) )
	if (q1 > 0):
		q2 = -q2
	rospy.loginfo( [q1,q2,q3, c2 ,x, y, dh[1][0], dh[2][0] ] )
	to_joint_state(q1,q2,q3)

if __name__ == '__main__':
	rospy.init_node('ikin', anonymous=True)

	print os.path.dirname(os.path.realpath(__file__))
	dh = np.loadtxt(os.path.dirname(os.path.realpath(__file__)) +'/dh.txt',dtype = 'd', delimiter=' ')
	pub = rospy.Publisher('joint_states', JointState, queue_size = 10)
	rospy.Subscriber('pose_stamped', PoseStamped, ikin_handler)
	rospy.spin()

