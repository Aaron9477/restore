// Generated by gencpp from file my_image_transport/zed_roi.msg
// DO NOT EDIT!


#ifndef MY_IMAGE_TRANSPORT_MESSAGE_ZED_ROI_H
#define MY_IMAGE_TRANSPORT_MESSAGE_ZED_ROI_H


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
struct zed_roi_
{
  typedef zed_roi_<ContainerAllocator> Type;

  zed_roi_()
    : x_offset(0)
    , y_offset(0)
    , height(0)
    , width(0)
    , depth(0)  {
    }
  zed_roi_(const ContainerAllocator& _alloc)
    : x_offset(0)
    , y_offset(0)
    , height(0)
    , width(0)
    , depth(0)  {
  (void)_alloc;
    }



   typedef uint32_t _x_offset_type;
  _x_offset_type x_offset;

   typedef uint32_t _y_offset_type;
  _y_offset_type y_offset;

   typedef uint32_t _height_type;
  _height_type height;

   typedef uint32_t _width_type;
  _width_type width;

   typedef uint32_t _depth_type;
  _depth_type depth;




  typedef boost::shared_ptr< ::my_image_transport::zed_roi_<ContainerAllocator> > Ptr;
  typedef boost::shared_ptr< ::my_image_transport::zed_roi_<ContainerAllocator> const> ConstPtr;

}; // struct zed_roi_

typedef ::my_image_transport::zed_roi_<std::allocator<void> > zed_roi;

typedef boost::shared_ptr< ::my_image_transport::zed_roi > zed_roiPtr;
typedef boost::shared_ptr< ::my_image_transport::zed_roi const> zed_roiConstPtr;

// constants requiring out of line definition



template<typename ContainerAllocator>
std::ostream& operator<<(std::ostream& s, const ::my_image_transport::zed_roi_<ContainerAllocator> & v)
{
ros::message_operations::Printer< ::my_image_transport::zed_roi_<ContainerAllocator> >::stream(s, "", v);
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
struct IsFixedSize< ::my_image_transport::zed_roi_<ContainerAllocator> >
  : TrueType
  { };

template <class ContainerAllocator>
struct IsFixedSize< ::my_image_transport::zed_roi_<ContainerAllocator> const>
  : TrueType
  { };

template <class ContainerAllocator>
struct IsMessage< ::my_image_transport::zed_roi_<ContainerAllocator> >
  : TrueType
  { };

template <class ContainerAllocator>
struct IsMessage< ::my_image_transport::zed_roi_<ContainerAllocator> const>
  : TrueType
  { };

template <class ContainerAllocator>
struct HasHeader< ::my_image_transport::zed_roi_<ContainerAllocator> >
  : FalseType
  { };

template <class ContainerAllocator>
struct HasHeader< ::my_image_transport::zed_roi_<ContainerAllocator> const>
  : FalseType
  { };


template<class ContainerAllocator>
struct MD5Sum< ::my_image_transport::zed_roi_<ContainerAllocator> >
{
  static const char* value()
  {
    return "5f54fceba1d05d91a2eb9a32181b7cd6";
  }

  static const char* value(const ::my_image_transport::zed_roi_<ContainerAllocator>&) { return value(); }
  static const uint64_t static_value1 = 0x5f54fceba1d05d91ULL;
  static const uint64_t static_value2 = 0xa2eb9a32181b7cd6ULL;
};

template<class ContainerAllocator>
struct DataType< ::my_image_transport::zed_roi_<ContainerAllocator> >
{
  static const char* value()
  {
    return "my_image_transport/zed_roi";
  }

  static const char* value(const ::my_image_transport::zed_roi_<ContainerAllocator>&) { return value(); }
};

template<class ContainerAllocator>
struct Definition< ::my_image_transport::zed_roi_<ContainerAllocator> >
{
  static const char* value()
  {
    return "uint32 x_offset\n\
uint32 y_offset\n\
uint32 height\n\
uint32 width\n\
uint32 depth\n\
";
  }

  static const char* value(const ::my_image_transport::zed_roi_<ContainerAllocator>&) { return value(); }
};

} // namespace message_traits
} // namespace ros

namespace ros
{
namespace serialization
{

  template<class ContainerAllocator> struct Serializer< ::my_image_transport::zed_roi_<ContainerAllocator> >
  {
    template<typename Stream, typename T> inline static void allInOne(Stream& stream, T m)
    {
      stream.next(m.x_offset);
      stream.next(m.y_offset);
      stream.next(m.height);
      stream.next(m.width);
      stream.next(m.depth);
    }

    ROS_DECLARE_ALLINONE_SERIALIZER
  }; // struct zed_roi_

} // namespace serialization
} // namespace ros

namespace ros
{
namespace message_operations
{

template<class ContainerAllocator>
struct Printer< ::my_image_transport::zed_roi_<ContainerAllocator> >
{
  template<typename Stream> static void stream(Stream& s, const std::string& indent, const ::my_image_transport::zed_roi_<ContainerAllocator>& v)
  {
    s << indent << "x_offset: ";
    Printer<uint32_t>::stream(s, indent + "  ", v.x_offset);
    s << indent << "y_offset: ";
    Printer<uint32_t>::stream(s, indent + "  ", v.y_offset);
    s << indent << "height: ";
    Printer<uint32_t>::stream(s, indent + "  ", v.height);
    s << indent << "width: ";
    Printer<uint32_t>::stream(s, indent + "  ", v.width);
    s << indent << "depth: ";
    Printer<uint32_t>::stream(s, indent + "  ", v.depth);
  }
};

} // namespace message_operations
} // namespace ros

#endif // MY_IMAGE_TRANSPORT_MESSAGE_ZED_ROI_H