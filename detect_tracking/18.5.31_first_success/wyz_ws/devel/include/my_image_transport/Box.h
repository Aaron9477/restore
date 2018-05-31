// Generated by gencpp from file my_image_transport/Box.msg
// DO NOT EDIT!


#ifndef MY_IMAGE_TRANSPORT_MESSAGE_BOX_H
#define MY_IMAGE_TRANSPORT_MESSAGE_BOX_H


#include <string>
#include <vector>
#include <map>

#include <ros/types.h>
#include <ros/serialization.h>
#include <ros/builtin_message_traits.h>
#include <ros/message_operations.h>


namespace my_image_transport
{
template <class ContainerAllocator>
struct Box_
{
  typedef Box_<ContainerAllocator> Type;

  Box_()
    : x(0)
    , y(0)
    , height(0)
    , width(0)  {
    }
  Box_(const ContainerAllocator& _alloc)
    : x(0)
    , y(0)
    , height(0)
    , width(0)  {
  (void)_alloc;
    }



   typedef int64_t _x_type;
  _x_type x;

   typedef int64_t _y_type;
  _y_type y;

   typedef int64_t _height_type;
  _height_type height;

   typedef int64_t _width_type;
  _width_type width;




  typedef boost::shared_ptr< ::my_image_transport::Box_<ContainerAllocator> > Ptr;
  typedef boost::shared_ptr< ::my_image_transport::Box_<ContainerAllocator> const> ConstPtr;

}; // struct Box_

typedef ::my_image_transport::Box_<std::allocator<void> > Box;

typedef boost::shared_ptr< ::my_image_transport::Box > BoxPtr;
typedef boost::shared_ptr< ::my_image_transport::Box const> BoxConstPtr;

// constants requiring out of line definition



template<typename ContainerAllocator>
std::ostream& operator<<(std::ostream& s, const ::my_image_transport::Box_<ContainerAllocator> & v)
{
ros::message_operations::Printer< ::my_image_transport::Box_<ContainerAllocator> >::stream(s, "", v);
return s;
}

} // namespace my_image_transport

namespace ros
{
namespace message_traits
{



// BOOLTRAITS {'IsFixedSize': True, 'IsMessage': True, 'HasHeader': False}
// {'my_image_transport': ['/home/ubuntu/WYZ/wyz_ws/src/my_image_transport/msg']}

// !!!!!!!!!!! ['__class__', '__delattr__', '__dict__', '__doc__', '__eq__', '__format__', '__getattribute__', '__hash__', '__init__', '__module__', '__ne__', '__new__', '__reduce__', '__reduce_ex__', '__repr__', '__setattr__', '__sizeof__', '__str__', '__subclasshook__', '__weakref__', '_parsed_fields', 'constants', 'fields', 'full_name', 'has_header', 'header_present', 'names', 'package', 'parsed_fields', 'short_name', 'text', 'types']




template <class ContainerAllocator>
struct IsFixedSize< ::my_image_transport::Box_<ContainerAllocator> >
  : TrueType
  { };

template <class ContainerAllocator>
struct IsFixedSize< ::my_image_transport::Box_<ContainerAllocator> const>
  : TrueType
  { };

template <class ContainerAllocator>
struct IsMessage< ::my_image_transport::Box_<ContainerAllocator> >
  : TrueType
  { };

template <class ContainerAllocator>
struct IsMessage< ::my_image_transport::Box_<ContainerAllocator> const>
  : TrueType
  { };

template <class ContainerAllocator>
struct HasHeader< ::my_image_transport::Box_<ContainerAllocator> >
  : FalseType
  { };

template <class ContainerAllocator>
struct HasHeader< ::my_image_transport::Box_<ContainerAllocator> const>
  : FalseType
  { };


template<class ContainerAllocator>
struct MD5Sum< ::my_image_transport::Box_<ContainerAllocator> >
{
  static const char* value()
  {
    return "457faef109159de721ed2633dde4ee23";
  }

  static const char* value(const ::my_image_transport::Box_<ContainerAllocator>&) { return value(); }
  static const uint64_t static_value1 = 0x457faef109159de7ULL;
  static const uint64_t static_value2 = 0x21ed2633dde4ee23ULL;
};

template<class ContainerAllocator>
struct DataType< ::my_image_transport::Box_<ContainerAllocator> >
{
  static const char* value()
  {
    return "my_image_transport/Box";
  }

  static const char* value(const ::my_image_transport::Box_<ContainerAllocator>&) { return value(); }
};

template<class ContainerAllocator>
struct Definition< ::my_image_transport::Box_<ContainerAllocator> >
{
  static const char* value()
  {
    return "int64 x\n\
int64 y\n\
int64 height\n\
int64 width\n\
";
  }

  static const char* value(const ::my_image_transport::Box_<ContainerAllocator>&) { return value(); }
};

} // namespace message_traits
} // namespace ros

namespace ros
{
namespace serialization
{

  template<class ContainerAllocator> struct Serializer< ::my_image_transport::Box_<ContainerAllocator> >
  {
    template<typename Stream, typename T> inline static void allInOne(Stream& stream, T m)
    {
      stream.next(m.x);
      stream.next(m.y);
      stream.next(m.height);
      stream.next(m.width);
    }

    ROS_DECLARE_ALLINONE_SERIALIZER
  }; // struct Box_

} // namespace serialization
} // namespace ros

namespace ros
{
namespace message_operations
{

template<class ContainerAllocator>
struct Printer< ::my_image_transport::Box_<ContainerAllocator> >
{
  template<typename Stream> static void stream(Stream& s, const std::string& indent, const ::my_image_transport::Box_<ContainerAllocator>& v)
  {
    s << indent << "x: ";
    Printer<int64_t>::stream(s, indent + "  ", v.x);
    s << indent << "y: ";
    Printer<int64_t>::stream(s, indent + "  ", v.y);
    s << indent << "height: ";
    Printer<int64_t>::stream(s, indent + "  ", v.height);
    s << indent << "width: ";
    Printer<int64_t>::stream(s, indent + "  ", v.width);
  }
};

} // namespace message_operations
} // namespace ros

#endif // MY_IMAGE_TRANSPORT_MESSAGE_BOX_H