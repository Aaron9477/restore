
(cl:in-package :asdf)

(defsystem "my_image_transport-msg"
  :depends-on (:roslisp-msg-protocol :roslisp-utils )
  :components ((:file "_package")
    (:file "Box" :depends-on ("_package_Box"))
    (:file "_package_Box" :depends-on ("_package"))
    (:file "zed_roi" :depends-on ("_package_zed_roi"))
    (:file "_package_zed_roi" :depends-on ("_package"))
  ))