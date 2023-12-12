(in-package :ymm)

(define-condition ymm/error (condition) ())

(define-condition ymm/executable-not-found
  (ymm/error)
  ((executable-name :initarg :executable-name
                    :reader ymm/executable-not-found-executable-name))
  (:report (lambda (condition stream)
                   (format stream "Required executable is not found: ~a"
                           (ymm/executable-not-found-executable-name condition)))))

(define-condition ymm/not-supported-platform
  (ymm/error)
  ((os-name :initarg :os-name
            :reader ymm/not-supported-platform-os-name))
  (:report (lambda (condition stream)
             (format stream "Not supported platform detected: ~a"
                     (ymm/not-supported-platform-os-name condition)))))

(define-condition ymm/pure-abstract-function-called
  (condition)
  ((class-name :initarg :class-name
               :reader ymm/pure-abstract-function-called-class-name)
   (method-name :initarg :method-name
                :reader ymm/pure-abstract-function-called-method-name))
  (:report (lambda (condition stream)
             (format stream "Pure abstract method called: ~a.~a"
                     (ymm/pure-abstract-function-called-class-name condition)
                     (ymm/pure-abstract-function-called-method-name condition)))))
