;; Auto-generated. Do not edit!


(when (boundp 'fasterrcnn::output)
  (if (not (find-package "FASTERRCNN"))
    (make-package "FASTERRCNN"))
  (shadow 'output (find-package "FASTERRCNN")))
(unless (find-package "FASTERRCNN::OUTPUT")
  (make-package "FASTERRCNN::OUTPUT"))

(in-package "ROS")
;;//! \htmlinclude output.msg.html


(defclass fasterrcnn::output
  :super ros::object
  :slots (_output ))

(defmethod fasterrcnn::output
  (:init
   (&key
    ((:output __output) (make-array 4 :initial-element 0.0 :element-type :float))
    )
   (send-super :init)
   (setq _output __output)
   self)
  (:output
   (&optional __output)
   (if __output (setq _output __output)) _output)
  (:serialization-length
   ()
   (+
    ;; float32[4] _output
    (* 4    4)
    ))
  (:serialize
   (&optional strm)
   (let ((s (if strm strm
              (make-string-output-stream (send self :serialization-length)))))
     ;; float32[4] _output
     (dotimes (i 4)
       (sys::poke (elt _output i) (send s :buffer) (send s :count) :float) (incf (stream-count s) 4)
       )
     ;;
     (if (null strm) (get-output-stream-string s))))
  (:deserialize
   (buf &optional (ptr- 0))
   ;; float32[4] _output
   (dotimes (i (length _output))
     (setf (elt _output i) (sys::peek buf ptr- :float)) (incf ptr- 4)
     )
   ;;
   self)
  )

(setf (get fasterrcnn::output :md5sum-) "b0921ba9077f39adb4c574ad1d537831")
(setf (get fasterrcnn::output :datatype-) "fasterrcnn/output")
(setf (get fasterrcnn::output :definition-)
      "float32[4] output

")



(provide :fasterrcnn/output "b0921ba9077f39adb4c574ad1d537831")


