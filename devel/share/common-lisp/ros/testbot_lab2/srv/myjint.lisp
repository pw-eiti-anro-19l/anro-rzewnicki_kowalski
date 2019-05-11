; Auto-generated. Do not edit!


(cl:in-package testbot_lab2-srv)


;//! \htmlinclude myjint-request.msg.html

(cl:defclass <myjint-request> (roslisp-msg-protocol:ros-message)
  ((x
    :reader x
    :initarg :x
    :type cl:float
    :initform 0.0)
   (y
    :reader y
    :initarg :y
    :type cl:float
    :initform 0.0)
   (z
    :reader z
    :initarg :z
    :type cl:float
    :initform 0.0)
   (time
    :reader time
    :initarg :time
    :type cl:float
    :initform 0.0)
   (type
    :reader type
    :initarg :type
    :type cl:string
    :initform ""))
)

(cl:defclass myjint-request (<myjint-request>)
  ())

(cl:defmethod cl:initialize-instance :after ((m <myjint-request>) cl:&rest args)
  (cl:declare (cl:ignorable args))
  (cl:unless (cl:typep m 'myjint-request)
    (roslisp-msg-protocol:msg-deprecation-warning "using old message class name testbot_lab2-srv:<myjint-request> is deprecated: use testbot_lab2-srv:myjint-request instead.")))

(cl:ensure-generic-function 'x-val :lambda-list '(m))
(cl:defmethod x-val ((m <myjint-request>))
  (roslisp-msg-protocol:msg-deprecation-warning "Using old-style slot reader testbot_lab2-srv:x-val is deprecated.  Use testbot_lab2-srv:x instead.")
  (x m))

(cl:ensure-generic-function 'y-val :lambda-list '(m))
(cl:defmethod y-val ((m <myjint-request>))
  (roslisp-msg-protocol:msg-deprecation-warning "Using old-style slot reader testbot_lab2-srv:y-val is deprecated.  Use testbot_lab2-srv:y instead.")
  (y m))

(cl:ensure-generic-function 'z-val :lambda-list '(m))
(cl:defmethod z-val ((m <myjint-request>))
  (roslisp-msg-protocol:msg-deprecation-warning "Using old-style slot reader testbot_lab2-srv:z-val is deprecated.  Use testbot_lab2-srv:z instead.")
  (z m))

(cl:ensure-generic-function 'time-val :lambda-list '(m))
(cl:defmethod time-val ((m <myjint-request>))
  (roslisp-msg-protocol:msg-deprecation-warning "Using old-style slot reader testbot_lab2-srv:time-val is deprecated.  Use testbot_lab2-srv:time instead.")
  (time m))

(cl:ensure-generic-function 'type-val :lambda-list '(m))
(cl:defmethod type-val ((m <myjint-request>))
  (roslisp-msg-protocol:msg-deprecation-warning "Using old-style slot reader testbot_lab2-srv:type-val is deprecated.  Use testbot_lab2-srv:type instead.")
  (type m))
(cl:defmethod roslisp-msg-protocol:serialize ((msg <myjint-request>) ostream)
  "Serializes a message object of type '<myjint-request>"
  (cl:let ((bits (roslisp-utils:encode-double-float-bits (cl:slot-value msg 'x))))
    (cl:write-byte (cl:ldb (cl:byte 8 0) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 8) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 16) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 24) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 32) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 40) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 48) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 56) bits) ostream))
  (cl:let ((bits (roslisp-utils:encode-double-float-bits (cl:slot-value msg 'y))))
    (cl:write-byte (cl:ldb (cl:byte 8 0) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 8) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 16) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 24) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 32) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 40) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 48) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 56) bits) ostream))
  (cl:let ((bits (roslisp-utils:encode-double-float-bits (cl:slot-value msg 'z))))
    (cl:write-byte (cl:ldb (cl:byte 8 0) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 8) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 16) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 24) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 32) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 40) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 48) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 56) bits) ostream))
  (cl:let ((bits (roslisp-utils:encode-double-float-bits (cl:slot-value msg 'time))))
    (cl:write-byte (cl:ldb (cl:byte 8 0) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 8) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 16) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 24) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 32) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 40) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 48) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 56) bits) ostream))
  (cl:let ((__ros_str_len (cl:length (cl:slot-value msg 'type))))
    (cl:write-byte (cl:ldb (cl:byte 8 0) __ros_str_len) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 8) __ros_str_len) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 16) __ros_str_len) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 24) __ros_str_len) ostream))
  (cl:map cl:nil #'(cl:lambda (c) (cl:write-byte (cl:char-code c) ostream)) (cl:slot-value msg 'type))
)
(cl:defmethod roslisp-msg-protocol:deserialize ((msg <myjint-request>) istream)
  "Deserializes a message object of type '<myjint-request>"
    (cl:let ((bits 0))
      (cl:setf (cl:ldb (cl:byte 8 0) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 8) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 16) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 24) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 32) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 40) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 48) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 56) bits) (cl:read-byte istream))
    (cl:setf (cl:slot-value msg 'x) (roslisp-utils:decode-double-float-bits bits)))
    (cl:let ((bits 0))
      (cl:setf (cl:ldb (cl:byte 8 0) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 8) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 16) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 24) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 32) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 40) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 48) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 56) bits) (cl:read-byte istream))
    (cl:setf (cl:slot-value msg 'y) (roslisp-utils:decode-double-float-bits bits)))
    (cl:let ((bits 0))
      (cl:setf (cl:ldb (cl:byte 8 0) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 8) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 16) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 24) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 32) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 40) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 48) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 56) bits) (cl:read-byte istream))
    (cl:setf (cl:slot-value msg 'z) (roslisp-utils:decode-double-float-bits bits)))
    (cl:let ((bits 0))
      (cl:setf (cl:ldb (cl:byte 8 0) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 8) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 16) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 24) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 32) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 40) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 48) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 56) bits) (cl:read-byte istream))
    (cl:setf (cl:slot-value msg 'time) (roslisp-utils:decode-double-float-bits bits)))
    (cl:let ((__ros_str_len 0))
      (cl:setf (cl:ldb (cl:byte 8 0) __ros_str_len) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 8) __ros_str_len) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 16) __ros_str_len) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 24) __ros_str_len) (cl:read-byte istream))
      (cl:setf (cl:slot-value msg 'type) (cl:make-string __ros_str_len))
      (cl:dotimes (__ros_str_idx __ros_str_len msg)
        (cl:setf (cl:char (cl:slot-value msg 'type) __ros_str_idx) (cl:code-char (cl:read-byte istream)))))
  msg
)
(cl:defmethod roslisp-msg-protocol:ros-datatype ((msg (cl:eql '<myjint-request>)))
  "Returns string type for a service object of type '<myjint-request>"
  "testbot_lab2/myjintRequest")
(cl:defmethod roslisp-msg-protocol:ros-datatype ((msg (cl:eql 'myjint-request)))
  "Returns string type for a service object of type 'myjint-request"
  "testbot_lab2/myjintRequest")
(cl:defmethod roslisp-msg-protocol:md5sum ((type (cl:eql '<myjint-request>)))
  "Returns md5sum for a message object of type '<myjint-request>"
  "3217da37e7b93e31d3fd5f2778f26983")
(cl:defmethod roslisp-msg-protocol:md5sum ((type (cl:eql 'myjint-request)))
  "Returns md5sum for a message object of type 'myjint-request"
  "3217da37e7b93e31d3fd5f2778f26983")
(cl:defmethod roslisp-msg-protocol:message-definition ((type (cl:eql '<myjint-request>)))
  "Returns full string definition for message of type '<myjint-request>"
  (cl:format cl:nil "float64 x~%float64 y~%float64 z~%float64 time~%string type~%~%~%"))
(cl:defmethod roslisp-msg-protocol:message-definition ((type (cl:eql 'myjint-request)))
  "Returns full string definition for message of type 'myjint-request"
  (cl:format cl:nil "float64 x~%float64 y~%float64 z~%float64 time~%string type~%~%~%"))
(cl:defmethod roslisp-msg-protocol:serialization-length ((msg <myjint-request>))
  (cl:+ 0
     8
     8
     8
     8
     4 (cl:length (cl:slot-value msg 'type))
))
(cl:defmethod roslisp-msg-protocol:ros-message-to-list ((msg <myjint-request>))
  "Converts a ROS message object to a list"
  (cl:list 'myjint-request
    (cl:cons ':x (x msg))
    (cl:cons ':y (y msg))
    (cl:cons ':z (z msg))
    (cl:cons ':time (time msg))
    (cl:cons ':type (type msg))
))
;//! \htmlinclude myjint-response.msg.html

(cl:defclass <myjint-response> (roslisp-msg-protocol:ros-message)
  ((status
    :reader status
    :initarg :status
    :type cl:string
    :initform ""))
)

(cl:defclass myjint-response (<myjint-response>)
  ())

(cl:defmethod cl:initialize-instance :after ((m <myjint-response>) cl:&rest args)
  (cl:declare (cl:ignorable args))
  (cl:unless (cl:typep m 'myjint-response)
    (roslisp-msg-protocol:msg-deprecation-warning "using old message class name testbot_lab2-srv:<myjint-response> is deprecated: use testbot_lab2-srv:myjint-response instead.")))

(cl:ensure-generic-function 'status-val :lambda-list '(m))
(cl:defmethod status-val ((m <myjint-response>))
  (roslisp-msg-protocol:msg-deprecation-warning "Using old-style slot reader testbot_lab2-srv:status-val is deprecated.  Use testbot_lab2-srv:status instead.")
  (status m))
(cl:defmethod roslisp-msg-protocol:serialize ((msg <myjint-response>) ostream)
  "Serializes a message object of type '<myjint-response>"
  (cl:let ((__ros_str_len (cl:length (cl:slot-value msg 'status))))
    (cl:write-byte (cl:ldb (cl:byte 8 0) __ros_str_len) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 8) __ros_str_len) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 16) __ros_str_len) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 24) __ros_str_len) ostream))
  (cl:map cl:nil #'(cl:lambda (c) (cl:write-byte (cl:char-code c) ostream)) (cl:slot-value msg 'status))
)
(cl:defmethod roslisp-msg-protocol:deserialize ((msg <myjint-response>) istream)
  "Deserializes a message object of type '<myjint-response>"
    (cl:let ((__ros_str_len 0))
      (cl:setf (cl:ldb (cl:byte 8 0) __ros_str_len) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 8) __ros_str_len) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 16) __ros_str_len) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 24) __ros_str_len) (cl:read-byte istream))
      (cl:setf (cl:slot-value msg 'status) (cl:make-string __ros_str_len))
      (cl:dotimes (__ros_str_idx __ros_str_len msg)
        (cl:setf (cl:char (cl:slot-value msg 'status) __ros_str_idx) (cl:code-char (cl:read-byte istream)))))
  msg
)
(cl:defmethod roslisp-msg-protocol:ros-datatype ((msg (cl:eql '<myjint-response>)))
  "Returns string type for a service object of type '<myjint-response>"
  "testbot_lab2/myjintResponse")
(cl:defmethod roslisp-msg-protocol:ros-datatype ((msg (cl:eql 'myjint-response)))
  "Returns string type for a service object of type 'myjint-response"
  "testbot_lab2/myjintResponse")
(cl:defmethod roslisp-msg-protocol:md5sum ((type (cl:eql '<myjint-response>)))
  "Returns md5sum for a message object of type '<myjint-response>"
  "3217da37e7b93e31d3fd5f2778f26983")
(cl:defmethod roslisp-msg-protocol:md5sum ((type (cl:eql 'myjint-response)))
  "Returns md5sum for a message object of type 'myjint-response"
  "3217da37e7b93e31d3fd5f2778f26983")
(cl:defmethod roslisp-msg-protocol:message-definition ((type (cl:eql '<myjint-response>)))
  "Returns full string definition for message of type '<myjint-response>"
  (cl:format cl:nil "string status~%~%~%"))
(cl:defmethod roslisp-msg-protocol:message-definition ((type (cl:eql 'myjint-response)))
  "Returns full string definition for message of type 'myjint-response"
  (cl:format cl:nil "string status~%~%~%"))
(cl:defmethod roslisp-msg-protocol:serialization-length ((msg <myjint-response>))
  (cl:+ 0
     4 (cl:length (cl:slot-value msg 'status))
))
(cl:defmethod roslisp-msg-protocol:ros-message-to-list ((msg <myjint-response>))
  "Converts a ROS message object to a list"
  (cl:list 'myjint-response
    (cl:cons ':status (status msg))
))
(cl:defmethod roslisp-msg-protocol:service-request-type ((msg (cl:eql 'myjint)))
  'myjint-request)
(cl:defmethod roslisp-msg-protocol:service-response-type ((msg (cl:eql 'myjint)))
  'myjint-response)
(cl:defmethod roslisp-msg-protocol:ros-datatype ((msg (cl:eql 'myjint)))
  "Returns string type for a service object of type '<myjint>"
  "testbot_lab2/myjint")