;; Auto-generated. Do not edit!


(when (boundp 'object_follower_zed::zed_roi)
  (if (not (find-package "OBJECT_FOLLOWER_ZED"))
    (make-package "OBJECT_FOLLOWER_ZED"))
  (shadow 'zed_roi (find-package "OBJECT_FOLLOWER_ZED")))
(unless (find-package "OBJECT_FOLLOWER_ZED::ZED_ROI")
  (make-package "OBJECT_FOLLOWER_ZED::ZED_ROI"))

(in-package "ROS")
;;//! \htmlinclude zed_roi.msg.html


(defclass object_follower_zed::zed_roi
  :super ros::object
  :slots (_x_offset _y_offset _height _width _depth ))

(defmethod object_follower_zed::zed_roi
  (:init
   (&key
    ((:x_offset __x_offset) 0.0)
    ((:y_offset __y_offset) 0.0)
    ((:height __height) 0.0)
    ((:width __width) 0.0)
    ((:depth __depth) 0.0)
    )
   (send-super :init)
   (setq _x_offset (float __x_offset))
   (setq _y_offset (float __y_offset))
   (setq _height (float __height))
   (setq _width (float __width))
   (setq _depth (float __depth))
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
    ;; float32 _x_offset
    4
    ;; float32 _y_offset
    4
    ;; float32 _height
    4
    ;; float32 _width
    4
    ;; float32 _depth
    4
    ))
  (:serialize
   (&optional strm)
   (let ((s (if strm strm
              (make-string-output-stream (send self :serialization-length)))))
     ;; float32 _x_offset
       (sys::poke _x_offset (send s :buffer) (send s :count) :float) (incf (stream-count s) 4)
     ;; float32 _y_offset
       (sys::poke _y_offset (send s :buffer) (send s :count) :float) (incf (stream-count s) 4)
     ;; float32 _height
       (sys::poke _height (send s :buffer) (send s :count) :float) (incf (stream-count s) 4)
     ;; float32 _width
       (sys::poke _width (send s :buffer) (send s :count) :float) (incf (stream-count s) 4)
     ;; float32 _depth
       (sys::poke _depth (send s :buffer) (send s :count) :float) (incf (stream-count s) 4)
     ;;
     (if (null strm) (get-output-stream-string s))))
  (:deserialize
   (buf &optional (ptr- 0))
   ;; float32 _x_offset
     (setq _x_offset (sys::peek buf ptr- :float)) (incf ptr- 4)
   ;; float32 _y_offset
     (setq _y_offset (sys::peek buf ptr- :float)) (incf ptr- 4)
   ;; float32 _height
     (setq _height (sys::peek buf ptr- :float)) (incf ptr- 4)
   ;; float32 _width
     (setq _width (sys::peek buf ptr- :float)) (incf ptr- 4)
   ;; float32 _depth
     (setq _depth (sys::peek buf ptr- :float)) (incf ptr- 4)
   ;;
   self)
  )

(setf (get object_follower_zed::zed_roi :md5sum-) "6955979b614b0463501e8c8fdd6f9c58")
(setf (get object_follower_zed::zed_roi :datatype-) "object_follower_zed/zed_roi")
(setf (get object_follower_zed::zed_roi :definition-)
      "float32 x_offset
float32 y_offset
float32 height
float32 width
float32 depth

")



(provide :object_follower_zed/zed_roi "6955979b614b0463501e8c8fdd6f9c58")


