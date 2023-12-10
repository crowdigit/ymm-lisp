(defpackage ymm
  (:use :cl)
  (:export #:check-requirement
           #:ymm/not-supported-platform))
(in-package :ymm)

(define-condition ymm/not-supported-platform
  (condition) ((os-name :initarg :os-name
                        :reader ymm/not-supported-platform-os-name))
  (:report (lambda (condition stream)
             (format stream "Not supported platform detected: ~a" (ymm/not-supported-platform-os-name condition)))))

(defun check-requirement (os-name)
  "Check YMM requirement. Returns all requirements are met. Signals condition
otherwise"
  (if (string/= "Linux" os-name)
      (error 'ymm/not-supported-platform :os-name os-name))
  t)
