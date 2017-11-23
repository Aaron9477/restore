
(cl:in-package :asdf)

(defsystem "test-msg"
  :depends-on (:roslisp-msg-protocol :roslisp-utils )
  :components ((:file "_package")
    (:file "output" :depends-on ("_package_output"))
    (:file "_package_output" :depends-on ("_package"))
  ))