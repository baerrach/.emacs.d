(require 'use-package)

(straight-use-package '(uniquify :type built-in))

(use-package uniquify
  ;; Loads after 1 second of idle time.
  :defer 1
  :custom
  (uniquify-buffer-name-style 'forward "Add parts of each file's directory to the buffer name if not unique"))

(provide 'setup-uniquify)
