#!/usr/bin/python

import  numpy as np
import rospy
import os
from tf.transformations import *
from sensor_msgs.msg import JointState
from geometry_msgs.msg import PoseStamped


def nonkdl_kin(information):

    for i in range(count-1):
        trans_x = translation_matrix((dh[i][0], 0, 0))
        trans_z = translation_matrix((0, 0, dh[i][1]))
        rotation_x = rotation_matrix(dh[i][2], (1, 0, 0))
        rotation_z = rotation_matrix(information.position[i], (0, 0, 1))

        concatenated.append( concatenate_matrices(trans_z, rotation_z, trans_x, rotation_x))
    i=i+1
    trans_x = translation_matrix((data.position[i], 0, 0))
    trans_z = translation_matrix((0, 0, dh[i][1]))
    rotation_x = rotation_matrix(dh[i][2], (1, 0, 0))
    rotation_z = rotation_matrix(dh[i][3], (0, 0, 1))
    concatenated.append( concatenate_matrices(trans_z, rotation_z, trans_x, rotation_x))

    Tend = concatenate_matrices(concatenated[0],concatenated[1],concatenated[2])
    x, y, z = translation_from_matrix(Tend)
    qx, qy, qz, qw = quaternion_from_matrix(Tend)
    print Tk
    concatenated.clear()
    pose = PoseStamped()
    pose.header.frame_id = 'base_link'
    pose.header.stamp = rospy.Time.now()
    pose.pose.position.x = x
    pose.pose.position.y = y
    pose.pose.position.z = z
    pose.pose.orientation.x = qx
    pose.pose.orientation.y = qy
    pose.pose.orientation.z = qz
    pose.pose.orientation.w = qw
    pub.publish(pose)


if __name__ == '__main__':
    i=0
    rospy.init_node('NONKDL_KIN', anonymous=True)
    pub = rospy.Publisher('pose_stamped', PoseStamped, queue_size=10)
    rospy.Subscriber('joint_states', JointState, nonkdl_kin)

    print os.path.dirname(os.path.realpath(__file__))
    #f = open(os.path.dirname(os.path.realpath(__file__)) +'dh.txt', 'r')
    dh = np.loadtxt(os.path.dirname(os.path.realpath(__file__)) +'/dh.txt',dtype = 'd', delimiter=' ')
    count = np.loadtxt(os.path.dirname(os.path.realpath(__file__)) +'/count.txt')
    concatenated = []
    rospy.spin()
