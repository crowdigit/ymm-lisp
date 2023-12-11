(defpackage ymm
  (:use :cl)
  (:export #:check-os
           #:check-executable
           #:ymm/not-supported-platform
           #:ymm/executable-not-found))
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
  (condition)
  ((os-name :initarg :os-name
            :reader ymm/not-supported-platform-os-name))
  (:report (lambda (condition stream)
             (format stream "Not supported platform detected: ~a"
                     (ymm/not-supported-platform-os-name condition)))))

(defun check-os (os-name)
  "Check YMM requirement. Returns all requirements are met. Signals YMM/NOT-SUPPORTED-PLATFORM if not."
  (if (string/= "Linux" os-name)
      (error 'ymm/not-supported-platform :os-name os-name))
  t)

(defun check-executable (command)
  "Checks if given command is available. Signals YMM/EXECUTABLE-NOT-FOUND if not available.
  This function depends on Linux specific command `command`."
  (let* ((subcommand (format nil "command -v ~a" command)) ; form in quasiquote raises warning
         (result (nth-value 2 (uiop:run-program `("bash" "-c" ,subcommand)
                                               :ignore-error-status t))))
    (if (equal result 0)
        t
        (error 'ymm/executable-not-found :executable-name command))))

(defun main ()
  (check-os "Linux")
  (check-executable "jaq")
  (check-executable "yt-dlp"))
