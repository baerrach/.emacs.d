(require 'use-package)

(use-package saveplace
  ;; Loads after 1 second of idle time.
  :defer 1
  :custom
  (save-place t "Save point position between sessions"))

(provide 'setup-saveplace)
