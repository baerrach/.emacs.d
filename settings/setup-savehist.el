(require 'use-package)

(use-package savehist
  ;; Loads after 1 second of idle time.
  :defer 1
  :custom
  (history-length 1000))

(provide 'setup-savehist)
