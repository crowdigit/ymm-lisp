(defpackage ymm/tests
  (:use :cl
        :ymm
        :fiveam))
(in-package :ymm/tests)

;; NOTE: To run this test file, execute `(asdf:test-system :ymm)' in your Lisp.

(def-suite ymm-test-suite
           :description "Test suite for YMM")
(in-suite ymm-test-suite)

(test test-check-executable
  "Test CHECK-EXECUTABLE. YMM requires some executables be installed"
  (let ((command (format nil "~a" (gensym))))
    (signals ymm/executable-not-found (check-executable command)))
  (let ((command "cat"))
    (is-true (check-executable command))))
