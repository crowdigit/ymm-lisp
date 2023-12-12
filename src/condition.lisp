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

