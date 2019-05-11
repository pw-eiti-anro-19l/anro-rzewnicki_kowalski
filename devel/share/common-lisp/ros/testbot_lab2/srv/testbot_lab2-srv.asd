
(cl:in-package :asdf)

(defsystem "testbot_lab2-srv"
  :depends-on (:roslisp-msg-protocol :roslisp-utils )
  :components ((:file "_package")
    (:file "myjint" :depends-on ("_package_myjint"))
    (:file "_package_myjint" :depends-on ("_package"))
    (:file "myoint" :depends-on ("_package_myoint"))
    (:file "_package_myoint" :depends-on ("_package"))
  ))