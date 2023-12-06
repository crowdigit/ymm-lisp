(defsystem "ymm-lisp"
  :version "0.0.1"
  :author "crowdigit"
  :license ""
  :depends-on ()
  :components ((:module "src"
                :components
                ((:file "main"))))
  :description ""
  :in-order-to ((test-op (test-op "ymm-lisp/tests"))))

(defsystem "ymm-lisp/tests"
  :author "crowdigit"
  :license ""
  :depends-on ("ymm-lisp"
               "rove")
  :components ((:module "tests"
                :components
                ((:file "main"))))
  :description "Test system for ymm-lisp"
  :perform (test-op (op c) (symbol-call :rove :run c)))
