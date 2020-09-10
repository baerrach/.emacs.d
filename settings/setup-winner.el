(require 'use-package)

(use-package winner
  ;; Loads after 2 second of idle time.
  :defer 2
  :custom
  ;; Undo/redo window configuration with C-c <left>/<right>
  (winner-mode 1))

(provide 'setup-winner)
