;; shorthand for interactive lambdas
(defmacro λ (&rest body)
  `(lambda ()
     (interactive)
     ,@body))

(defmacro comment (&rest ignore))
