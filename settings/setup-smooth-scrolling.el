(require 'use-package)

(use-package smooth-scrolling
  ;; Loads after 1 second of idle time.
  :defer 1
  :config
  (smooth-scrolling-mode 1))

(provide 'setup-smooth-scrolling)
