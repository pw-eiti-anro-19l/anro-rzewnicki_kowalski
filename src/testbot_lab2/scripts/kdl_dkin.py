#! /usr/bin/python

import  numpy as np
import rospy
import os
from PyKDL import *
import math
from tf.transformations import *
from sensor_msgs.msg import JointState
from geometry_msgs.msg import PoseStamped



def kdl_kin(information):

    myChain = Chain()
    myframe = Frame();

    myChain.addSegment(Segment(Joint(Joint.None),myframe = Frame();.DH(0, 0, 0, 0)))

    myChain.addSegment(Segment(Joint(Joint.RotZ),myframe.DH(dh[0][0],dh[0][2],dh[0][1],dh[0][3])))

    myChain.addSegment(Segment(Joint(Joint.RotZ),myframe.DH(dh[1][0],dh[1][2],dh[1][1],dh[1][3])))

    myChain.addSegment(Segment(Joint(Joint.TransZ),myframe.DH(dh[2][0],dh[2][2],dh[2][1],dh[2][3])))

    jntAngles = JntArray(myChain.getNrOfJoints())
    jntAngles[2] = information.position[0]
    jntAngles[1] = information.position[1]
    jntAngles[0] = information.position[2] - dh[2][0]

    fksolver = ChainFkSolverPos_recursive(myChain)
    finalFrame = Frame()
    fksolver.JntToCart(jntAngles, finalFrame)
    q = pFrame.M.GetQuaternion()

    pose = PoseStamped()
    pose.header.frame_id = 'base_link'
    pose.header.stamp = rospy.Time.now()
    pose.pose.position.x = finalFrame.p[2]
    pose.pose.position.y = finalFrame.p[1]
    pose.pose.position.z = finalFrame.p[0]
    pose.pose.orientation.x = q[3]
    pose.pose.orientation.y = q[2]
    pose.pose.orientation.z = q[1]
    pose.pose.orientation.w = q[0]
    pub.publish(pose)


if __name__ == '__main__':
    rospy.init_node('KDL_KIN', anonymous=True)

    pub = rospy.Publisher('pose_stamped', PoseStamped, queue_size=10)
    marker_pub = rospy.Publisher('kdl_visualization', Marker, queue_size=100)

    rospy.Subscriber('joint_states', JointState, kdl_kin)
    f = open('dh.txt', 'r')
    dh = np.loadtxt('dh.txt',dtype = 'd', delimiter=' ')
    concatenated = []
    count = np.loadtxt('count.txt')

    rospy.spin()
