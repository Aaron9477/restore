
(cl:in-package :asdf)

(defsystem "object_follower_zed-msg"
  :depends-on (:roslisp-msg-protocol :roslisp-utils )
  :components ((:file "_package")
    (:file "zed_roi" :depends-on ("_package_zed_roi"))
    (:file "_package_zed_roi" :depends-on ("_package"))
  ))