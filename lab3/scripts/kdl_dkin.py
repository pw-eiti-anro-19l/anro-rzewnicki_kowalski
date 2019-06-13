#! /usr/bin/python

import  numpy as np
import rospy
import os
from PyKDL import *
import math
from tf.transformations import *
from sensor_msgs.msg import JointState
from geometry_msgs.msg import PoseStamped

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

def kdl_kinematic(information):

    myChain = Chain()
    myframe = Frame();

    myChain.addSegment(Segment(Joint(Joint.None),myframe.DH(0, 0, 0, 0)))

    myChain.addSegment(Segment(Joint(Joint.RotZ),myframe.DH(dh[1][0],dh[0][2],dh[0][1],dh[0][3])))

    myChain.addSegment(Segment(Joint(Joint.RotZ),myframe.DH(dh[2][0],dh[1][2],dh[1][1],dh[1][3])))

    myChain.addSegment(Segment(Joint(Joint.TransZ),myframe.DH(0,dh[2][2],dh[2][1],dh[2][3])))

    jntAngles = JntArray(myChain.getNrOfJoints())
    jntAngles[2] = -information.position[2]
    jntAngles[1] = information.position[1]
    jntAngles[0] = information.position[0] 

    fksolver = ChainFkSolverPos_recursive(myChain)
    finalFrame = Frame()
    fksolver.JntToCart(jntAngles, finalFrame)
    q = finalFrame.M.GetQuaternion()

    pub.publish(to_pose_stamped(finalFrame.p,q))


if __name__ == '__main__':
    rospy.init_node('KDL_KIN', anonymous=True)

    print os.path.dirname(os.path.realpath(__file__))
    dh = np.loadtxt(os.path.dirname(os.path.realpath(__file__)) +'/dh.txt',dtype = 'd', delimiter=' ')
    count = np.loadtxt(os.path.dirname(os.path.realpath(__file__)) +'/count.txt', dtype='int_')
    concatenated = []

    pub = rospy.Publisher('pose_stamped_kdl', PoseStamped, queue_size = 10)
    rospy.Subscriber('joint_states', JointState, kdl_kinematic)

    rospy.spin()
