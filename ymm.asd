(defsystem "ymm"
  :version "0.0.1"
  :author "crowdigit"
  :license ""
  :depends-on ()
  :components ((:module "src"
                        :components
                        ((:file "package")
                         (:file "main")
                         (:file "condition"))))
  :description ""
  :in-order-to ((test-op (test-op "ymm/tests"))))

(defsystem "ymm/tests"
  :author "crowdigit"
  :license ""
  :depends-on ("ymm"
               "fiveam")
  :components ((:module "tests"
                        :components
                        ((:file "main"))))
  :description "Test system for ymm"
  :perform (test-op (op c)
                    (symbol-call :fiveam :run!
                                 (find-symbol* :ymm-test-suite
                                               :ymm/tests))))
