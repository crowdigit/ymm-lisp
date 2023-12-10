(require :sb-cover)

(declaim (optimize sb-cover:store-coverage-data))
; list packages to generate coverage data
(asdf:oos 'asdf:load-op :ymm :force t)
(declaim (optimize (sb-cover:store-coverage-data 0)))

(asdf:test-system :ymm)
(sb-cover:report "coverage/")
