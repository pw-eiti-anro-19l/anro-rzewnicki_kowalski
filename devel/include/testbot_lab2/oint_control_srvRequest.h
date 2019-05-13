// Generated by gencpp from file testbot_lab2/oint_control_srvRequest.msg
// DO NOT EDIT!


#ifndef TESTBOT_LAB2_MESSAGE_OINT_CONTROL_SRVREQUEST_H
#define TESTBOT_LAB2_MESSAGE_OINT_CONTROL_SRVREQUEST_H


#include <string>
#include <vector>
#include <map>

#include <ros/types.h>
#include <ros/serialization.h>
#include <ros/builtin_message_traits.h>
#include <ros/message_operations.h>


namespace testbot_lab2
{
template <class ContainerAllocator>
struct oint_control_srvRequest_
{
  typedef oint_control_srvRequest_<ContainerAllocator> Type;

  oint_control_srvRequest_()
    : x(0.0)
    , y(0.0)
    , z(0.0)
    , rx(0.0)
    , ry(0.0)
    , rz(0.0)
    , time(0.0)
    , type()  {
    }
  oint_control_srvRequest_(const ContainerAllocator& _alloc)
    : x(0.0)
    , y(0.0)
    , z(0.0)
    , rx(0.0)
    , ry(0.0)
    , rz(0.0)
    , time(0.0)
    , type(_alloc)  {
  (void)_alloc;
    }



   typedef double _x_type;
  _x_type x;

   typedef double _y_type;
  _y_type y;

   typedef double _z_type;
  _z_type z;

   typedef double _rx_type;
  _rx_type rx;

   typedef double _ry_type;
  _ry_type ry;

   typedef double _rz_type;
  _rz_type rz;

   typedef double _time_type;
  _time_type time;

   typedef std::basic_string<char, std::char_traits<char>, typename ContainerAllocator::template rebind<char>::other >  _type_type;
  _type_type type;





  typedef boost::shared_ptr< ::testbot_lab2::oint_control_srvRequest_<ContainerAllocator> > Ptr;
  typedef boost::shared_ptr< ::testbot_lab2::oint_control_srvRequest_<ContainerAllocator> const> ConstPtr;

}; // struct oint_control_srvRequest_

typedef ::testbot_lab2::oint_control_srvRequest_<std::allocator<void> > oint_control_srvRequest;

typedef boost::shared_ptr< ::testbot_lab2::oint_control_srvRequest > oint_control_srvRequestPtr;
typedef boost::shared_ptr< ::testbot_lab2::oint_control_srvRequest const> oint_control_srvRequestConstPtr;

// constants requiring out of line definition



template<typename ContainerAllocator>
std::ostream& operator<<(std::ostream& s, const ::testbot_lab2::oint_control_srvRequest_<ContainerAllocator> & v)
{
ros::message_operations::Printer< ::testbot_lab2::oint_control_srvRequest_<ContainerAllocator> >::stream(s, "", v);
return s;
}

} // namespace testbot_lab2

namespace ros
{
namespace message_traits
{



// BOOLTRAITS {'IsFixedSize': False, 'IsMessage': True, 'HasHeader': False}
// {'sensor_msgs': ['/opt/ros/melodic/share/sensor_msgs/cmake/../msg'], 'std_msgs': ['/opt/ros/melodic/share/std_msgs/cmake/../msg'], 'geometry_msgs': ['/opt/ros/melodic/share/geometry_msgs/cmake/../msg']}

// !!!!!!!!!!! ['__class__', '__delattr__', '__dict__', '__doc__', '__eq__', '__format__', '__getattribute__', '__hash__', '__init__', '__module__', '__ne__', '__new__', '__reduce__', '__reduce_ex__', '__repr__', '__setattr__', '__sizeof__', '__str__', '__subclasshook__', '__weakref__', '_parsed_fields', 'constants', 'fields', 'full_name', 'has_header', 'header_present', 'names', 'package', 'parsed_fields', 'short_name', 'text', 'types']




template <class ContainerAllocator>
struct IsFixedSize< ::testbot_lab2::oint_control_srvRequest_<ContainerAllocator> >
  : FalseType
  { };

template <class ContainerAllocator>
struct IsFixedSize< ::testbot_lab2::oint_control_srvRequest_<ContainerAllocator> const>
  : FalseType
  { };

template <class ContainerAllocator>
struct IsMessage< ::testbot_lab2::oint_control_srvRequest_<ContainerAllocator> >
  : TrueType
  { };

template <class ContainerAllocator>
struct IsMessage< ::testbot_lab2::oint_control_srvRequest_<ContainerAllocator> const>
  : TrueType
  { };

template <class ContainerAllocator>
struct HasHeader< ::testbot_lab2::oint_control_srvRequest_<ContainerAllocator> >
  : FalseType
  { };

template <class ContainerAllocator>
struct HasHeader< ::testbot_lab2::oint_control_srvRequest_<ContainerAllocator> const>
  : FalseType
  { };


template<class ContainerAllocator>
struct MD5Sum< ::testbot_lab2::oint_control_srvRequest_<ContainerAllocator> >
{
  static const char* value()
  {
    return "08caab7c5891c24a5a84927eb4d68223";
  }

  static const char* value(const ::testbot_lab2::oint_control_srvRequest_<ContainerAllocator>&) { return value(); }
  static const uint64_t static_value1 = 0x08caab7c5891c24aULL;
  static const uint64_t static_value2 = 0x5a84927eb4d68223ULL;
};

template<class ContainerAllocator>
struct DataType< ::testbot_lab2::oint_control_srvRequest_<ContainerAllocator> >
{
  static const char* value()
  {
    return "testbot_lab2/oint_control_srvRequest";
  }

  static const char* value(const ::testbot_lab2::oint_control_srvRequest_<ContainerAllocator>&) { return value(); }
};

template<class ContainerAllocator>
struct Definition< ::testbot_lab2::oint_control_srvRequest_<ContainerAllocator> >
{
  static const char* value()
  {
    return "float64 x\n"
"float64 y\n"
"float64 z\n"
"float64 rx\n"
"float64 ry\n"
"float64 rz\n"
"float64 time\n"
"string type\n"
;
  }

  static const char* value(const ::testbot_lab2::oint_control_srvRequest_<ContainerAllocator>&) { return value(); }
};

} // namespace message_traits
} // namespace ros

namespace ros
{
namespace serialization
{

  template<class ContainerAllocator> struct Serializer< ::testbot_lab2::oint_control_srvRequest_<ContainerAllocator> >
  {
    template<typename Stream, typename T> inline static void allInOne(Stream& stream, T m)
    {
      stream.next(m.x);
      stream.next(m.y);
      stream.next(m.z);
      stream.next(m.rx);
      stream.next(m.ry);
      stream.next(m.rz);
      stream.next(m.time);
      stream.next(m.type);
    }

    ROS_DECLARE_ALLINONE_SERIALIZER
  }; // struct oint_control_srvRequest_

} // namespace serialization
} // namespace ros

namespace ros
{
namespace message_operations
{

template<class ContainerAllocator>
struct Printer< ::testbot_lab2::oint_control_srvRequest_<ContainerAllocator> >
{
  template<typename Stream> static void stream(Stream& s, const std::string& indent, const ::testbot_lab2::oint_control_srvRequest_<ContainerAllocator>& v)
  {
    s << indent << "x: ";
    Printer<double>::stream(s, indent + "  ", v.x);
    s << indent << "y: ";
    Printer<double>::stream(s, indent + "  ", v.y);
    s << indent << "z: ";
    Printer<double>::stream(s, indent + "  ", v.z);
    s << indent << "rx: ";
    Printer<double>::stream(s, indent + "  ", v.rx);
    s << indent << "ry: ";
    Printer<double>::stream(s, indent + "  ", v.ry);
    s << indent << "rz: ";
    Printer<double>::stream(s, indent + "  ", v.rz);
    s << indent << "time: ";
    Printer<double>::stream(s, indent + "  ", v.time);
    s << indent << "type: ";
    Printer<std::basic_string<char, std::char_traits<char>, typename ContainerAllocator::template rebind<char>::other > >::stream(s, indent + "  ", v.type);
  }
};

} // namespace message_operations
} // namespace ros

#endif // TESTBOT_LAB2_MESSAGE_OINT_CONTROL_SRVREQUEST_H