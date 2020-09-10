(require 'use-package)

(use-package recentf
  ;; Loads after 1 second of idle time.
  :defer 1
  :custom
  (recentf-max-saved-items 100 "just 20 is too recent"))

(provide 'setup-recentf)
