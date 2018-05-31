; Auto-generated. Do not edit!


(cl:in-package object_follower_zed-msg)


;//! \htmlinclude zed_roi.msg.html

(cl:defclass <zed_roi> (roslisp-msg-protocol:ros-message)
  ((x_offset
    :reader x_offset
    :initarg :x_offset
    :type cl:float
    :initform 0.0)
   (y_offset
    :reader y_offset
    :initarg :y_offset
    :type cl:float
    :initform 0.0)
   (height
    :reader height
    :initarg :height
    :type cl:float
    :initform 0.0)
   (width
    :reader width
    :initarg :width
    :type cl:float
    :initform 0.0)
   (depth
    :reader depth
    :initarg :depth
    :type cl:float
    :initform 0.0))
)

(cl:defclass zed_roi (<zed_roi>)
  ())

(cl:defmethod cl:initialize-instance :after ((m <zed_roi>) cl:&rest args)
  (cl:declare (cl:ignorable args))
  (cl:unless (cl:typep m 'zed_roi)
    (roslisp-msg-protocol:msg-deprecation-warning "using old message class name object_follower_zed-msg:<zed_roi> is deprecated: use object_follower_zed-msg:zed_roi instead.")))

(cl:ensure-generic-function 'x_offset-val :lambda-list '(m))
(cl:defmethod x_offset-val ((m <zed_roi>))
  (roslisp-msg-protocol:msg-deprecation-warning "Using old-style slot reader object_follower_zed-msg:x_offset-val is deprecated.  Use object_follower_zed-msg:x_offset instead.")
  (x_offset m))

(cl:ensure-generic-function 'y_offset-val :lambda-list '(m))
(cl:defmethod y_offset-val ((m <zed_roi>))
  (roslisp-msg-protocol:msg-deprecation-warning "Using old-style slot reader object_follower_zed-msg:y_offset-val is deprecated.  Use object_follower_zed-msg:y_offset instead.")
  (y_offset m))

(cl:ensure-generic-function 'height-val :lambda-list '(m))
(cl:defmethod height-val ((m <zed_roi>))
  (roslisp-msg-protocol:msg-deprecation-warning "Using old-style slot reader object_follower_zed-msg:height-val is deprecated.  Use object_follower_zed-msg:height instead.")
  (height m))

(cl:ensure-generic-function 'width-val :lambda-list '(m))
(cl:defmethod width-val ((m <zed_roi>))
  (roslisp-msg-protocol:msg-deprecation-warning "Using old-style slot reader object_follower_zed-msg:width-val is deprecated.  Use object_follower_zed-msg:width instead.")
  (width m))

(cl:ensure-generic-function 'depth-val :lambda-list '(m))
(cl:defmethod depth-val ((m <zed_roi>))
  (roslisp-msg-protocol:msg-deprecation-warning "Using old-style slot reader object_follower_zed-msg:depth-val is deprecated.  Use object_follower_zed-msg:depth instead.")
  (depth m))
(cl:defmethod roslisp-msg-protocol:serialize ((msg <zed_roi>) ostream)
  "Serializes a message object of type '<zed_roi>"
  (cl:let ((bits (roslisp-utils:encode-single-float-bits (cl:slot-value msg 'x_offset))))
    (cl:write-byte (cl:ldb (cl:byte 8 0) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 8) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 16) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 24) bits) ostream))
  (cl:let ((bits (roslisp-utils:encode-single-float-bits (cl:slot-value msg 'y_offset))))
    (cl:write-byte (cl:ldb (cl:byte 8 0) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 8) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 16) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 24) bits) ostream))
  (cl:let ((bits (roslisp-utils:encode-single-float-bits (cl:slot-value msg 'height))))
    (cl:write-byte (cl:ldb (cl:byte 8 0) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 8) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 16) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 24) bits) ostream))
  (cl:let ((bits (roslisp-utils:encode-single-float-bits (cl:slot-value msg 'width))))
    (cl:write-byte (cl:ldb (cl:byte 8 0) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 8) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 16) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 24) bits) ostream))
  (cl:let ((bits (roslisp-utils:encode-single-float-bits (cl:slot-value msg 'depth))))
    (cl:write-byte (cl:ldb (cl:byte 8 0) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 8) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 16) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 24) bits) ostream))
)
(cl:defmethod roslisp-msg-protocol:deserialize ((msg <zed_roi>) istream)
  "Deserializes a message object of type '<zed_roi>"
    (cl:let ((bits 0))
      (cl:setf (cl:ldb (cl:byte 8 0) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 8) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 16) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 24) bits) (cl:read-byte istream))
    (cl:setf (cl:slot-value msg 'x_offset) (roslisp-utils:decode-single-float-bits bits)))
    (cl:let ((bits 0))
      (cl:setf (cl:ldb (cl:byte 8 0) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 8) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 16) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 24) bits) (cl:read-byte istream))
    (cl:setf (cl:slot-value msg 'y_offset) (roslisp-utils:decode-single-float-bits bits)))
    (cl:let ((bits 0))
      (cl:setf (cl:ldb (cl:byte 8 0) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 8) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 16) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 24) bits) (cl:read-byte istream))
    (cl:setf (cl:slot-value msg 'height) (roslisp-utils:decode-single-float-bits bits)))
    (cl:let ((bits 0))
      (cl:setf (cl:ldb (cl:byte 8 0) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 8) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 16) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 24) bits) (cl:read-byte istream))
    (cl:setf (cl:slot-value msg 'width) (roslisp-utils:decode-single-float-bits bits)))
    (cl:let ((bits 0))
      (cl:setf (cl:ldb (cl:byte 8 0) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 8) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 16) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 24) bits) (cl:read-byte istream))
    (cl:setf (cl:slot-value msg 'depth) (roslisp-utils:decode-single-float-bits bits)))
  msg
)
(cl:defmethod roslisp-msg-protocol:ros-datatype ((msg (cl:eql '<zed_roi>)))
  "Returns string type for a message object of type '<zed_roi>"
  "object_follower_zed/zed_roi")
(cl:defmethod roslisp-msg-protocol:ros-datatype ((msg (cl:eql 'zed_roi)))
  "Returns string type for a message object of type 'zed_roi"
  "object_follower_zed/zed_roi")
(cl:defmethod roslisp-msg-protocol:md5sum ((type (cl:eql '<zed_roi>)))
  "Returns md5sum for a message object of type '<zed_roi>"
  "6955979b614b0463501e8c8fdd6f9c58")
(cl:defmethod roslisp-msg-protocol:md5sum ((type (cl:eql 'zed_roi)))
  "Returns md5sum for a message object of type 'zed_roi"
  "6955979b614b0463501e8c8fdd6f9c58")
(cl:defmethod roslisp-msg-protocol:message-definition ((type (cl:eql '<zed_roi>)))
  "Returns full string definition for message of type '<zed_roi>"
  (cl:format cl:nil "float32 x_offset~%float32 y_offset~%float32 height~%float32 width~%float32 depth~%~%~%"))
(cl:defmethod roslisp-msg-protocol:message-definition ((type (cl:eql 'zed_roi)))
  "Returns full string definition for message of type 'zed_roi"
  (cl:format cl:nil "float32 x_offset~%float32 y_offset~%float32 height~%float32 width~%float32 depth~%~%~%"))
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
