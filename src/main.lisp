(defpackage ymm
  (:use :cl)
  (:export :foo))
(in-package :ymm)

(defun foo (n)
  (1+ n))
