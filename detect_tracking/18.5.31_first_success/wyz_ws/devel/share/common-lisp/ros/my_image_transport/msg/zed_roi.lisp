; Auto-generated. Do not edit!


(cl:in-package my_image_transport-msg)


;//! \htmlinclude zed_roi.msg.html

(cl:defclass <zed_roi> (roslisp-msg-protocol:ros-message)
  ((x_offset
    :reader x_offset
    :initarg :x_offset
    :type cl:integer
    :initform 0)
   (y_offset
    :reader y_offset
    :initarg :y_offset
    :type cl:integer
    :initform 0)
   (height
    :reader height
    :initarg :height
    :type cl:integer
    :initform 0)
   (width
    :reader width
    :initarg :width
    :type cl:integer
    :initform 0)
   (depth
    :reader depth
    :initarg :depth
    :type cl:integer
    :initform 0))
)

(cl:defclass zed_roi (<zed_roi>)
  ())

(cl:defmethod cl:initialize-instance :after ((m <zed_roi>) cl:&rest args)
  (cl:declare (cl:ignorable args))
  (cl:unless (cl:typep m 'zed_roi)
    (roslisp-msg-protocol:msg-deprecation-warning "using old message class name my_image_transport-msg:<zed_roi> is deprecated: use my_image_transport-msg:zed_roi instead.")))

(cl:ensure-generic-function 'x_offset-val :lambda-list '(m))
(cl:defmethod x_offset-val ((m <zed_roi>))
  (roslisp-msg-protocol:msg-deprecation-warning "Using old-style slot reader my_image_transport-msg:x_offset-val is deprecated.  Use my_image_transport-msg:x_offset instead.")
  (x_offset m))

(cl:ensure-generic-function 'y_offset-val :lambda-list '(m))
(cl:defmethod y_offset-val ((m <zed_roi>))
  (roslisp-msg-protocol:msg-deprecation-warning "Using old-style slot reader my_image_transport-msg:y_offset-val is deprecated.  Use my_image_transport-msg:y_offset instead.")
  (y_offset m))

(cl:ensure-generic-function 'height-val :lambda-list '(m))
(cl:defmethod height-val ((m <zed_roi>))
  (roslisp-msg-protocol:msg-deprecation-warning "Using old-style slot reader my_image_transport-msg:height-val is deprecated.  Use my_image_transport-msg:height instead.")
  (height m))

(cl:ensure-generic-function 'width-val :lambda-list '(m))
(cl:defmethod width-val ((m <zed_roi>))
  (roslisp-msg-protocol:msg-deprecation-warning "Using old-style slot reader my_image_transport-msg:width-val is deprecated.  Use my_image_transport-msg:width instead.")
  (width m))

(cl:ensure-generic-function 'depth-val :lambda-list '(m))
(cl:defmethod depth-val ((m <zed_roi>))
  (roslisp-msg-protocol:msg-deprecation-warning "Using old-style slot reader my_image_transport-msg:depth-val is deprecated.  Use my_image_transport-msg:depth instead.")
  (depth m))
(cl:defmethod roslisp-msg-protocol:serialize ((msg <zed_roi>) ostream)
  "Serializes a message object of type '<zed_roi>"
  (cl:write-byte (cl:ldb (cl:byte 8 0) (cl:slot-value msg 'x_offset)) ostream)
  (cl:write-byte (cl:ldb (cl:byte 8 8) (cl:slot-value msg 'x_offset)) ostream)
  (cl:write-byte (cl:ldb (cl:byte 8 16) (cl:slot-value msg 'x_offset)) ostream)
  (cl:write-byte (cl:ldb (cl:byte 8 24) (cl:slot-value msg 'x_offset)) ostream)
  (cl:write-byte (cl:ldb (cl:byte 8 0) (cl:slot-value msg 'y_offset)) ostream)
  (cl:write-byte (cl:ldb (cl:byte 8 8) (cl:slot-value msg 'y_offset)) ostream)
  (cl:write-byte (cl:ldb (cl:byte 8 16) (cl:slot-value msg 'y_offset)) ostream)
  (cl:write-byte (cl:ldb (cl:byte 8 24) (cl:slot-value msg 'y_offset)) ostream)
  (cl:write-byte (cl:ldb (cl:byte 8 0) (cl:slot-value msg 'height)) ostream)
  (cl:write-byte (cl:ldb (cl:byte 8 8) (cl:slot-value msg 'height)) ostream)
  (cl:write-byte (cl:ldb (cl:byte 8 16) (cl:slot-value msg 'height)) ostream)
  (cl:write-byte (cl:ldb (cl:byte 8 24) (cl:slot-value msg 'height)) ostream)
  (cl:write-byte (cl:ldb (cl:byte 8 0) (cl:slot-value msg 'width)) ostream)
  (cl:write-byte (cl:ldb (cl:byte 8 8) (cl:slot-value msg 'width)) ostream)
  (cl:write-byte (cl:ldb (cl:byte 8 16) (cl:slot-value msg 'width)) ostream)
  (cl:write-byte (cl:ldb (cl:byte 8 24) (cl:slot-value msg 'width)) ostream)
  (cl:write-byte (cl:ldb (cl:byte 8 0) (cl:slot-value msg 'depth)) ostream)
  (cl:write-byte (cl:ldb (cl:byte 8 8) (cl:slot-value msg 'depth)) ostream)
  (cl:write-byte (cl:ldb (cl:byte 8 16) (cl:slot-value msg 'depth)) ostream)
  (cl:write-byte (cl:ldb (cl:byte 8 24) (cl:slot-value msg 'depth)) ostream)
)
(cl:defmethod roslisp-msg-protocol:deserialize ((msg <zed_roi>) istream)
  "Deserializes a message object of type '<zed_roi>"
    (cl:setf (cl:ldb (cl:byte 8 0) (cl:slot-value msg 'x_offset)) (cl:read-byte istream))
    (cl:setf (cl:ldb (cl:byte 8 8) (cl:slot-value msg 'x_offset)) (cl:read-byte istream))
    (cl:setf (cl:ldb (cl:byte 8 16) (cl:slot-value msg 'x_offset)) (cl:read-byte istream))
    (cl:setf (cl:ldb (cl:byte 8 24) (cl:slot-value msg 'x_offset)) (cl:read-byte istream))
    (cl:setf (cl:ldb (cl:byte 8 0) (cl:slot-value msg 'y_offset)) (cl:read-byte istream))
    (cl:setf (cl:ldb (cl:byte 8 8) (cl:slot-value msg 'y_offset)) (cl:read-byte istream))
    (cl:setf (cl:ldb (cl:byte 8 16) (cl:slot-value msg 'y_offset)) (cl:read-byte istream))
    (cl:setf (cl:ldb (cl:byte 8 24) (cl:slot-value msg 'y_offset)) (cl:read-byte istream))
    (cl:setf (cl:ldb (cl:byte 8 0) (cl:slot-value msg 'height)) (cl:read-byte istream))
    (cl:setf (cl:ldb (cl:byte 8 8) (cl:slot-value msg 'height)) (cl:read-byte istream))
    (cl:setf (cl:ldb (cl:byte 8 16) (cl:slot-value msg 'height)) (cl:read-byte istream))
    (cl:setf (cl:ldb (cl:byte 8 24) (cl:slot-value msg 'height)) (cl:read-byte istream))
    (cl:setf (cl:ldb (cl:byte 8 0) (cl:slot-value msg 'width)) (cl:read-byte istream))
    (cl:setf (cl:ldb (cl:byte 8 8) (cl:slot-value msg 'width)) (cl:read-byte istream))
    (cl:setf (cl:ldb (cl:byte 8 16) (cl:slot-value msg 'width)) (cl:read-byte istream))
    (cl:setf (cl:ldb (cl:byte 8 24) (cl:slot-value msg 'width)) (cl:read-byte istream))
    (cl:setf (cl:ldb (cl:byte 8 0) (cl:slot-value msg 'depth)) (cl:read-byte istream))
    (cl:setf (cl:ldb (cl:byte 8 8) (cl:slot-value msg 'depth)) (cl:read-byte istream))
    (cl:setf (cl:ldb (cl:byte 8 16) (cl:slot-value msg 'depth)) (cl:read-byte istream))
    (cl:setf (cl:ldb (cl:byte 8 24) (cl:slot-value msg 'depth)) (cl:read-byte istream))
  msg
)
(cl:defmethod roslisp-msg-protocol:ros-datatype ((msg (cl:eql '<zed_roi>)))
  "Returns string type for a message object of type '<zed_roi>"
  "my_image_transport/zed_roi")
(cl:defmethod roslisp-msg-protocol:ros-datatype ((msg (cl:eql 'zed_roi)))
  "Returns string type for a message object of type 'zed_roi"
  "my_image_transport/zed_roi")
(cl:defmethod roslisp-msg-protocol:md5sum ((type (cl:eql '<zed_roi>)))
  "Returns md5sum for a message object of type '<zed_roi>"
  "5f54fceba1d05d91a2eb9a32181b7cd6")
(cl:defmethod roslisp-msg-protocol:md5sum ((type (cl:eql 'zed_roi)))
  "Returns md5sum for a message object of type 'zed_roi"
  "5f54fceba1d05d91a2eb9a32181b7cd6")
(cl:defmethod roslisp-msg-protocol:message-definition ((type (cl:eql '<zed_roi>)))
  "Returns full string definition for message of type '<zed_roi>"
  (cl:format cl:nil "uint32 x_offset~%uint32 y_offset~%uint32 height~%uint32 width~%uint32 depth~%~%~%"))
(cl:defmethod roslisp-msg-protocol:message-definition ((type (cl:eql 'zed_roi)))
  "Returns full string definition for message of type 'zed_roi"
  (cl:format cl:nil "uint32 x_offset~%uint32 y_offset~%uint32 height~%uint32 width~%uint32 depth~%~%~%"))
(cl:defmethod roslisp-msg-protocol:serialization-length ((msg <zed_roi>))
  (cl:+ 0
     4
     4
     4
     4
     4
))
(cl:defmethod roslisp-msg-protocol:ros-message-to-list ((msg <zed_roi>))
  "Converts a ROS message object to a list"
  (cl:list 'zed_roi
    (cl:cons ':x_offset (x_offset msg))
    (cl:cons ':y_offset (y_offset msg))
    (cl:cons ':height (height msg))
    (cl:cons ':width (width msg))
    (cl:cons ':depth (depth msg))
))
