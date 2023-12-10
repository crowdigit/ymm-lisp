(defpackage ymm/tests
  (:use :cl
        :ymm
        :fiveam))
(in-package :ymm/tests)

;; NOTE: To run this test file, execute `(asdf:test-system :ymm)' in your Lisp.

(def-suite ymm-test-suite
           :description "Test suite for YMM")
(in-suite ymm-test-suite)

(test test-check-requirement-os
  "Test CHECK-REQUIREMENT function. YMM supports Linux only"
  (is-true (check-requirement "Linux"))
  (signals ymm/not-supported-platform (check-requirement "Windows"))
  (signals ymm/not-supported-platform (check-requirement "Windows NT"))
  (signals ymm/not-supported-platform (check-requirement "Blah blah blah...")))
