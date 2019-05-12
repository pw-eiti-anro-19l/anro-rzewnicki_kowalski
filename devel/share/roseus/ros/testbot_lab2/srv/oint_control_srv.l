;; Auto-generated. Do not edit!


(when (boundp 'testbot_lab2::oint_control_srv)
  (if (not (find-package "TESTBOT_LAB2"))
    (make-package "TESTBOT_LAB2"))
  (shadow 'oint_control_srv (find-package "TESTBOT_LAB2")))
(unless (find-package "TESTBOT_LAB2::OINT_CONTROL_SRV")
  (make-package "TESTBOT_LAB2::OINT_CONTROL_SRV"))
(unless (find-package "TESTBOT_LAB2::OINT_CONTROL_SRVREQUEST")
  (make-package "TESTBOT_LAB2::OINT_CONTROL_SRVREQUEST"))
(unless (find-package "TESTBOT_LAB2::OINT_CONTROL_SRVRESPONSE")
  (make-package "TESTBOT_LAB2::OINT_CONTROL_SRVRESPONSE"))

(in-package "ROS")





(defclass testbot_lab2::oint_control_srvRequest
  :super ros::object
  :slots (_x _y _z _rx _ry _rz _time _type ))

(defmethod testbot_lab2::oint_control_srvRequest
  (:init
   (&key
    ((:x __x) 0.0)
    ((:y __y) 0.0)
    ((:z __z) 0.0)
    ((:rx __rx) 0.0)
    ((:ry __ry) 0.0)
    ((:rz __rz) 0.0)
    ((:time __time) 0.0)
    ((:type __type) "")
    )
   (send-super :init)
   (setq _x (float __x))
   (setq _y (float __y))
   (setq _z (float __z))
   (setq _rx (float __rx))
   (setq _ry (float __ry))
   (setq _rz (float __rz))
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
  (:rx
   (&optional __rx)
   (if __rx (setq _rx __rx)) _rx)
  (:ry
   (&optional __ry)
   (if __ry (setq _ry __ry)) _ry)
  (:rz
   (&optional __rz)
   (if __rz (setq _rz __rz)) _rz)
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
    ;; float64 _rx
    8
    ;; float64 _ry
    8
    ;; float64 _rz
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
     ;; float64 _rx
       (sys::poke _rx (send s :buffer) (send s :count) :double) (incf (stream-count s) 8)
     ;; float64 _ry
       (sys::poke _ry (send s :buffer) (send s :count) :double) (incf (stream-count s) 8)
     ;; float64 _rz
       (sys::poke _rz (send s :buffer) (send s :count) :double) (incf (stream-count s) 8)
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
   ;; float64 _rx
     (setq _rx (sys::peek buf ptr- :double)) (incf ptr- 8)
   ;; float64 _ry
     (setq _ry (sys::peek buf ptr- :double)) (incf ptr- 8)
   ;; float64 _rz
     (setq _rz (sys::peek buf ptr- :double)) (incf ptr- 8)
   ;; float64 _time
     (setq _time (sys::peek buf ptr- :double)) (incf ptr- 8)
   ;; string _type
     (let (n) (setq n (sys::peek buf ptr- :integer)) (incf ptr- 4) (setq _type (subseq buf ptr- (+ ptr- n))) (incf ptr- n))
   ;;
   self)
  )

(defclass testbot_lab2::oint_control_srvResponse
  :super ros::object
  :slots (_status ))

(defmethod testbot_lab2::oint_control_srvResponse
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

(defclass testbot_lab2::oint_control_srv
  :super ros::object
  :slots ())

(setf (get testbot_lab2::oint_control_srv :md5sum-) "77bf4dc6349a8d26f822ba0f0ed91793")
(setf (get testbot_lab2::oint_control_srv :datatype-) "testbot_lab2/oint_control_srv")
(setf (get testbot_lab2::oint_control_srv :request) testbot_lab2::oint_control_srvRequest)
(setf (get testbot_lab2::oint_control_srv :response) testbot_lab2::oint_control_srvResponse)

(defmethod testbot_lab2::oint_control_srvRequest
  (:response () (instance testbot_lab2::oint_control_srvResponse :init)))

(setf (get testbot_lab2::oint_control_srvRequest :md5sum-) "77bf4dc6349a8d26f822ba0f0ed91793")
(setf (get testbot_lab2::oint_control_srvRequest :datatype-) "testbot_lab2/oint_control_srvRequest")
(setf (get testbot_lab2::oint_control_srvRequest :definition-)
      "float64 x
float64 y
float64 z
float64 rx
float64 ry
float64 rz
float64 time
string type
---
string status

")

(setf (get testbot_lab2::oint_control_srvResponse :md5sum-) "77bf4dc6349a8d26f822ba0f0ed91793")
(setf (get testbot_lab2::oint_control_srvResponse :datatype-) "testbot_lab2/oint_control_srvResponse")
(setf (get testbot_lab2::oint_control_srvResponse :definition-)
      "float64 x
float64 y
float64 z
float64 rx
float64 ry
float64 rz
float64 time
string type
---
string status

")



(provide :testbot_lab2/oint_control_srv "77bf4dc6349a8d26f822ba0f0ed91793")


