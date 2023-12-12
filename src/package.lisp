(defpackage ymm
  (:use :cl)
  (:export #:check-os
           #:check-executable
           #:ymm/error
           #:ymm/executable-not-found
           #:ymm/not-supported-platform))
