;; Auto-generated. Do not edit!


(when (boundp 'my_image_transport::zed_roi)
  (if (not (find-package "MY_IMAGE_TRANSPORT"))
    (make-package "MY_IMAGE_TRANSPORT"))
  (shadow 'zed_roi (find-package "MY_IMAGE_TRANSPORT")))
(unless (find-package "MY_IMAGE_TRANSPORT::ZED_ROI")
  (make-package "MY_IMAGE_TRANSPORT::ZED_ROI"))

(in-package "ROS")
;;//! \htmlinclude zed_roi.msg.html


(defclass my_image_transport::zed_roi
  :super ros::object
  :slots (_x_offset _y_offset _height _width _depth ))

(defmethod my_image_transport::zed_roi
  (:init
   (&key
    ((:x_offset __x_offset) 0)
    ((:y_offset __y_offset) 0)
    ((:height __height) 0)
    ((:width __width) 0)
    ((:depth __depth) 0)
    )
   (send-super :init)
   (setq _x_offset (round __x_offset))
   (setq _y_offset (round __y_offset))
   (setq _height (round __height))
   (setq _width (round __width))
   (setq _depth (round __depth))
   self)
  (:x_offset
   (&optional __x_offset)
   (if __x_offset (setq _x_offset __x_offset)) _x_offset)
  (:y_offset
   (&optional __y_offset)
   (if __y_offset (setq _y_offset __y_offset)) _y_offset)
  (:height
   (&optional __height)
   (if __height (setq _height __height)) _height)
  (:width
   (&optional __width)
   (if __width (setq _width __width)) _width)
  (:depth
   (&optional __depth)
   (if __depth (setq _depth __depth)) _depth)
  (:serialization-length
   ()
   (+
    ;; uint32 _x_offset
    4
    ;; uint32 _y_offset
    4
    ;; uint32 _height
    4
    ;; uint32 _width
    4
    ;; uint32 _depth
    4
    ))
  (:serialize
   (&optional strm)
   (let ((s (if strm strm
              (make-string-output-stream (send self :serialization-length)))))
     ;; uint32 _x_offset
       (write-long _x_offset s)
     ;; uint32 _y_offset
       (write-long _y_offset s)
     ;; uint32 _height
       (write-long _height s)
     ;; uint32 _width
       (write-long _width s)
     ;; uint32 _depth
       (write-long _depth s)
     ;;
     (if (null strm) (get-output-stream-string s))))
  (:deserialize
   (buf &optional (ptr- 0))
   ;; uint32 _x_offset
     (setq _x_offset (sys::peek buf ptr- :integer)) (incf ptr- 4)
   ;; uint32 _y_offset
     (setq _y_offset (sys::peek buf ptr- :integer)) (incf ptr- 4)
   ;; uint32 _height
     (setq _height (sys::peek buf ptr- :integer)) (incf ptr- 4)
   ;; uint32 _width
     (setq _width (sys::peek buf ptr- :integer)) (incf ptr- 4)
   ;; uint32 _depth
     (setq _depth (sys::peek buf ptr- :integer)) (incf ptr- 4)
   ;;
   self)
  )

(setf (get my_image_transport::zed_roi :md5sum-) "5f54fceba1d05d91a2eb9a32181b7cd6")
(setf (get my_image_transport::zed_roi :datatype-) "my_image_transport/zed_roi")
(setf (get my_image_transport::zed_roi :definition-)
      "uint32 x_offset
uint32 y_offset
uint32 height
uint32 width
uint32 depth

")



(provide :my_image_transport/zed_roi "5f54fceba1d05d91a2eb9a32181b7cd6")


