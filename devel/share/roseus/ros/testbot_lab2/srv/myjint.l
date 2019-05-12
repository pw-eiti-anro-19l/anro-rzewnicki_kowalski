;; Auto-generated. Do not edit!


(when (boundp 'testbot_lab2::myjint)
  (if (not (find-package "TESTBOT_LAB2"))
    (make-package "TESTBOT_LAB2"))
  (shadow 'myjint (find-package "TESTBOT_LAB2")))
(unless (find-package "TESTBOT_LAB2::MYJINT")
  (make-package "TESTBOT_LAB2::MYJINT"))
(unless (find-package "TESTBOT_LAB2::MYJINTREQUEST")
  (make-package "TESTBOT_LAB2::MYJINTREQUEST"))
(unless (find-package "TESTBOT_LAB2::MYJINTRESPONSE")
  (make-package "TESTBOT_LAB2::MYJINTRESPONSE"))

(in-package "ROS")





(defclass testbot_lab2::myjintRequest
  :super ros::object
  :slots (_x _y _z _time _type ))

(defmethod testbot_lab2::myjintRequest
  (:init
   (&key
    ((:x __x) 0.0)
    ((:y __y) 0.0)
    ((:z __z) 0.0)
    ((:time __time) 0.0)
    ((:type __type) "")
    )
   (send-super :init)
   (setq _x (float __x))
   (setq _y (float __y))
   (setq _z (float __z))
   (setq _time (float __time))
   (setq _type (string __type))
   self)
  (:x
   (&optional __x)
   (if __x (setq _x __x)) _x)
  (:y
   (&optional __y)
   (if __y (setq _y __y)) _y)
  (:z
   (&optional __z)
   (if __z (setq _z __z)) _z)
  (:time
   (&optional __time)
   (if __time (setq _time __time)) _time)
  (:type
   (&optional __type)
   (if __type (setq _type __type)) _type)
  (:serialization-length
   ()
   (+
    ;; float64 _x
    8
    ;; float64 _y
    8
    ;; float64 _z
    8
    ;; float64 _time
    8
    ;; string _type
    4 (length _type)
    ))
  (:serialize
   (&optional strm)
   (let ((s (if strm strm
              (make-string-output-stream (send self :serialization-length)))))
     ;; float64 _x
       (sys::poke _x (send s :buffer) (send s :count) :double) (incf (stream-count s) 8)
     ;; float64 _y
       (sys::poke _y (send s :buffer) (send s :count) :double) (incf (stream-count s) 8)
     ;; float64 _z
       (sys::poke _z (send s :buffer) (send s :count) :double) (incf (stream-count s) 8)
     ;; float64 _time
       (sys::poke _time (send s :buffer) (send s :count) :double) (incf (stream-count s) 8)
     ;; string _type
       (write-long (length _type) s) (princ _type s)
     ;;
     (if (null strm) (get-output-stream-string s))))
  (:deserialize
   (buf &optional (ptr- 0))
   ;; float64 _x
     (setq _x (sys::peek buf ptr- :double)) (incf ptr- 8)
   ;; float64 _y
     (setq _y (sys::peek buf ptr- :double)) (incf ptr- 8)
   ;; float64 _z
     (setq _z (sys::peek buf ptr- :double)) (incf ptr- 8)
   ;; float64 _time
     (setq _time (sys::peek buf ptr- :double)) (incf ptr- 8)
   ;; string _type
     (let (n) (setq n (sys::peek buf ptr- :integer)) (incf ptr- 4) (setq _type (subseq buf ptr- (+ ptr- n))) (incf ptr- n))
   ;;
   self)
  )

(defclass testbot_lab2::myjintResponse
  :super ros::object
  :slots (_status ))

(defmethod testbot_lab2::myjintResponse
  (:init
   (&key
    ((:status __status) "")
    )
   (send-super :init)
   (setq _status (string __status))
   self)
  (:status
   (&optional __status)
   (if __status (setq _status __status)) _status)
  (:serialization-length
   ()
   (+
    ;; string _status
    4 (length _status)
    ))
  (:serialize
   (&optional strm)
   (let ((s (if strm strm
              (make-string-output-stream (send self :serialization-length)))))
     ;; string _status
       (write-long (length _status) s) (princ _status s)
     ;;
     (if (null strm) (get-output-stream-string s))))
  (:deserialize
   (buf &optional (ptr- 0))
   ;; string _status
     (let (n) (setq n (sys::peek buf ptr- :integer)) (incf ptr- 4) (setq _status (subseq buf ptr- (+ ptr- n))) (incf ptr- n))
   ;;
   self)
  )

(defclass testbot_lab2::myjint
  :super ros::object
  :slots ())

(setf (get testbot_lab2::myjint :md5sum-) "3217da37e7b93e31d3fd5f2778f26983")
(setf (get testbot_lab2::myjint :datatype-) "testbot_lab2/myjint")
(setf (get testbot_lab2::myjint :request) testbot_lab2::myjintRequest)
(setf (get testbot_lab2::myjint :response) testbot_lab2::myjintResponse)

(defmethod testbot_lab2::myjintRequest
  (:response () (instance testbot_lab2::myjintResponse :init)))

(setf (get testbot_lab2::myjintRequest :md5sum-) "3217da37e7b93e31d3fd5f2778f26983")
(setf (get testbot_lab2::myjintRequest :datatype-) "testbot_lab2/myjintRequest")
(setf (get testbot_lab2::myjintRequest :definition-)
      "float64 x
float64 y
float64 z
float64 time
string type
---
string status

")

(setf (get testbot_lab2::myjintResponse :md5sum-) "3217da37e7b93e31d3fd5f2778f26983")
(setf (get testbot_lab2::myjintResponse :datatype-) "testbot_lab2/myjintResponse")
(setf (get testbot_lab2::myjintResponse :definition-)
      "float64 x
float64 y
float64 z
float64 time
string type
---
string status

")



(provide :testbot_lab2/myjint "3217da37e7b93e31d3fd5f2778f26983")


