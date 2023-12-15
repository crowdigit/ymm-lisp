(in-package :ymm)

(defparameter *ytdl* "yt-dlp")
(defparameter *jq* "jq")

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
  (check-executable *jq*)
  (check-executable *ytdl*))
