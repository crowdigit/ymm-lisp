(defpackage ymm-lisp/tests/main
  (:use :cl
        :ymm-lisp
        :rove))
(in-package :ymm-lisp/tests/main)

;; NOTE: To run this test file, execute `(asdf:test-system :ymm-lisp)' in your Lisp.

(deftest test-target-1
  (testing "should (= 1 1) to be true"
    (ok (= 1 1))))
