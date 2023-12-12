(in-package :ymm)

(defclass ytdl () ())

(defmethod fetch-metadata (obj)
  (error 'ymm/pure-abstract-function-called :class-name 'ytdl :method-name 'fetch-metadata))

(defclass ytdl-mock (ytdl) ())

(defmethod fetch-metadata ((obj ytdl-mock))
  "{\"asdf\": \"zxcv\"}")
