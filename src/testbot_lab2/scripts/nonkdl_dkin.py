#!/usr/bin/python

import  numpy as np
import rospy
import os
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

def nonkdl_kinematics(information):
 
    #pierwszy stopien
    trans_x = translation_matrix((dh[2][0], 0, 0))
    trans_z = translation_matrix((0, 0, -dh[0][1]))
    rotation_x = rotation_matrix(dh[0][2], (1, 0, 0))
    rotation_z = rotation_matrix(-information.position[1], (0, 0, 1))
    concatenated.append( concatenate_matrices(trans_z, rotation_z, trans_x, rotation_x))

 # drugi stopien
    trans_x = translation_matrix((dh[1][0], 0, 0))
    trans_z = translation_matrix((0, 0, 0))
    rotation_x = rotation_matrix(dh[1][2], (1, 0, 0))
    rotation_z = rotation_matrix(-information.position[0], (0, 0, 1))

    concatenated.append( concatenate_matrices(trans_z, rotation_z, trans_x, rotation_x))

    # trzeci stopien
    trans_x = translation_matrix((0, 0, 0))
    trans_z = translation_matrix((0, 0, -information.position[2]))
    rotation_x = rotation_matrix(dh[2][2], (1, 0, 0))
    rotation_z = rotation_matrix(dh[2][3], (0, 0, 1))
    concatenated.append( concatenate_matrices(trans_z, rotation_z, trans_x, rotation_x))

    Tend = concatenate_matrices(concatenated[2],concatenated[1],concatenated[0])
    xyz = translation_from_matrix(Tend)
    quat = quaternion_from_matrix(Tend)
    del concatenated[:]
    #concatenated.clear()
    #rospy.sleep(1)
    pub.publish(to_pose_stamped(xyz,quat))


if __name__ == '__main__':
    rospy.init_node('NONKDL_KIN', anonymous=True)


    i=0
    concatenated = []
    print os.path.dirname(os.path.realpath(__file__))
    dh = np.loadtxt(os.path.dirname(os.path.realpath(__file__)) +'/dh.txt',dtype = 'd', delimiter=' ')
    count = np.loadtxt(os.path.dirname(os.path.realpath(__file__)) +'/count.txt',dtype='int_')

    pub = rospy.Publisher('pose_stamped_non', PoseStamped, queue_size=10)
    rospy.Subscriber('joint_states', JointState, nonkdl_kinematics)

    rospy.spin()
