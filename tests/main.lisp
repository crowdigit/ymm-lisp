(defpackage ymm/tests
  (:use :cl
        :ymm
        :fiveam))
(in-package :ymm/tests)

;; NOTE: To run this test file, execute `(asdf:test-system :ymm)' in your Lisp.

(def-suite ymm-test-suite
           :description "Test suite for YMM")
(in-suite ymm-test-suite)

(test test-foo
  "Test foo function"
  (is (= '2 (foo 1))))
