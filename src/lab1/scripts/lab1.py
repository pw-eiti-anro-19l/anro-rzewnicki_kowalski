#!/usr/bin/env python

from __future__ import print_function

import roslib; roslib.load_manifest('lab1')
import rospy

from geometry_msgs.msg import Twist

import sys, select, termios, tty

msg = """
Do sterowania nalezy uzyc:
p l d g
---------------------
Aby zakonczyc: 
CTRL-C 
"""
up = rospy.get_param("/gora")
down = rospy.get_param("/dol")
left = rospy.get_param("/lewo")
right = rospy.get_param("/prawo")

moves_of_turtle = {
        up :(1,0,0,0),
        left:(0,0,0,1),
        right:(0,0,0,-1),
        down:(-1,0,0,0),
    }


def getKey():
    tty.setraw(sys.stdin.fileno())
    select.select([sys.stdin], [], [], 0)
    key = sys.stdin.read(1)
    termios.tcsetattr(sys.stdin, termios.TCSADRAIN, settings)
    return key


def vels(turn):
    return "currently:\tturn %s " % (turn)

if __name__=="__main__":
    settings = termios.tcgetattr(sys.stdin)

    pub = rospy.Publisher('cmd_vel', Twist, queue_size = 5)
    rospy.init_node('teleop_twist_keyboard')

    speed =  0.5
    turn = 1.0
    x = 0
    y = 0
    z = 0
    th = 0
    status = 0

    try:
        print(msg)
        print(vels(turn))
        while(1):
            key = getKey()
            if key in moves_of_turtle.keys():
                x = moves_of_turtle[key][0]
                y = moves_of_turtle[key][1]
                z = moves_of_turtle[key][2]
                th = moves_of_turtle[key][3]

            else:
                x = 0
                y = 0
                z = 0
                th = 0
                if (key == '\x03'):
                    break

            twist = Twist()
            twist.linear.x = x*speed; twist.linear.y = y*speed; twist.linear.z = z*speed;
            twist.angular.x = 0; twist.angular.y = 0; twist.angular.z = th*turn
            pub.publish(twist)

    except Exception as e:
        print(e)

    finally:
        twist = Twist()
        twist.linear.x = 0; twist.linear.y = 0; twist.linear.z = 0
        twist.angular.x = 0; twist.angular.y = 0; twist.angular.z = 0
        pub.publish(twist)

termios.tcsetattr(sys.stdin, termios.TCSADRAIN, settings)
