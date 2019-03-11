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

moves_of_turtle = {
    rospy.get_param("/lab1/gora") :(1,0,0,0),
    rospy.get_param("/lab1/lewo") :(0,0,0,1),
    rospy.get_param("/lab1/prawo"):(0,0,0,-1),
    rospy.get_param("/lab1/dol") :(-1,0,0,0),
    }


def getKey():
    tty.setraw(sys.stdin.fileno())
    select.select([sys.stdin], [], [], 0)
    key = sys.stdin.read(1)
    termios.tcsetattr(sys.stdin, termios.TCSADRAIN, settings)
    return key


if __name__=="__main__":
    settings = termios.tcgetattr(sys.stdin)

    pub = rospy.Publisher('turtle1/cmd_vel', Twist, queue_size = 5)
    rospy.init_node('lab1')

    speed =  0.5
    turn = 1.0
    x = 0
    y = 0
    z = 0
    th = 0

    try:
        print(msg)
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
