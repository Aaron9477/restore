# This Python file uses the following encoding: utf-8
"""autogenerated by genpy from object_follower_zed/zed_roi.msg. Do not edit."""
import sys
python3 = True if sys.hexversion > 0x03000000 else False
import genpy
import struct


class zed_roi(genpy.Message):
  _md5sum = "6955979b614b0463501e8c8fdd6f9c58"
  _type = "object_follower_zed/zed_roi"
  _has_header = False #flag to mark the presence of a Header object
  _full_text = """float32 x_offset
float32 y_offset
float32 height
float32 width
float32 depth
"""
  __slots__ = ['x_offset','y_offset','height','width','depth']
  _slot_types = ['float32','float32','float32','float32','float32']

  def __init__(self, *args, **kwds):
    """
    Constructor. Any message fields that are implicitly/explicitly
    set to None will be assigned a default value. The recommend
    use is keyword arguments as this is more robust to future message
    changes.  You cannot mix in-order arguments and keyword arguments.

    The available fields are:
       x_offset,y_offset,height,width,depth

    :param args: complete set of field values, in .msg order
    :param kwds: use keyword arguments corresponding to message field names
    to set specific fields.
    """
    if args or kwds:
      super(zed_roi, self).__init__(*args, **kwds)
      #message fields cannot be None, assign default values for those that are
      if self.x_offset is None:
        self.x_offset = 0.
      if self.y_offset is None:
        self.y_offset = 0.
      if self.height is None:
        self.height = 0.
      if self.width is None:
        self.width = 0.
      if self.depth is None:
        self.depth = 0.
    else:
      self.x_offset = 0.
      self.y_offset = 0.
      self.height = 0.
      self.width = 0.
      self.depth = 0.

  def _get_types(self):
    """
    internal API method
    """
    return self._slot_types

  def serialize(self, buff):
    """
    serialize message into buffer
    :param buff: buffer, ``StringIO``
    """
    try:
      _x = self
      buff.write(_get_struct_5f().pack(_x.x_offset, _x.y_offset, _x.height, _x.width, _x.depth))
    except struct.error as se: self._check_types(struct.error("%s: '%s' when writing '%s'" % (type(se), str(se), str(locals().get('_x', self)))))
    except TypeError as te: self._check_types(ValueError("%s: '%s' when writing '%s'" % (type(te), str(te), str(locals().get('_x', self)))))

  def deserialize(self, str):
    """
    unpack serialized message in str into this message instance
    :param str: byte array of serialized message, ``str``
    """
    try:
      end = 0
      _x = self
      start = end
      end += 20
      (_x.x_offset, _x.y_offset, _x.height, _x.width, _x.depth,) = _get_struct_5f().unpack(str[start:end])
      return self
    except struct.error as e:
      raise genpy.DeserializationError(e) #most likely buffer underfill


  def serialize_numpy(self, buff, numpy):
    """
    serialize message with numpy array types into buffer
    :param buff: buffer, ``StringIO``
    :param numpy: numpy python module
    """
    try:
      _x = self
      buff.write(_get_struct_5f().pack(_x.x_offset, _x.y_offset, _x.height, _x.width, _x.depth))
    except struct.error as se: self._check_types(struct.error("%s: '%s' when writing '%s'" % (type(se), str(se), str(locals().get('_x', self)))))
    except TypeError as te: self._check_types(ValueError("%s: '%s' when writing '%s'" % (type(te), str(te), str(locals().get('_x', self)))))

  def deserialize_numpy(self, str, numpy):
    """
    unpack serialized message in str into this message instance using numpy for array types
    :param str: byte array of serialized message, ``str``
    :param numpy: numpy python module
    """
    try:
      end = 0
      _x = self
      start = end
      end += 20
      (_x.x_offset, _x.y_offset, _x.height, _x.width, _x.depth,) = _get_struct_5f().unpack(str[start:end])
      return self
    except struct.error as e:
      raise genpy.DeserializationError(e) #most likely buffer underfill

_struct_I = genpy.struct_I
def _get_struct_I():
    global _struct_I
    return _struct_I
_struct_5f = None
def _get_struct_5f():
    global _struct_5f
    if _struct_5f is None:
        _struct_5f = struct.Struct("<5f")
    return _struct_5f
