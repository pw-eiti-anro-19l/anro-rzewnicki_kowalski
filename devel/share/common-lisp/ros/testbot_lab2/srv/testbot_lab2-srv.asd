
(cl:in-package :asdf)

(defsystem "testbot_lab2-srv"
  :depends-on (:roslisp-msg-protocol :roslisp-utils )
  :components ((:file "_package")
    (:file "jint_control_srv" :depends-on ("_package_jint_control_srv"))
    (:file "_package_jint_control_srv" :depends-on ("_package"))
    (:file "myjint" :depends-on ("_package_myjint"))
    (:file "_package_myjint" :depends-on ("_package"))
    (:file "myoint" :depends-on ("_package_myoint"))
    (:file "_package_myoint" :depends-on ("_package"))
    (:file "oint_control_srv" :depends-on ("_package_oint_control_srv"))
    (:file "_package_oint_control_srv" :depends-on ("_package"))
  ))