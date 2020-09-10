(require 'use-package)

;; Use emacsclientw.exe to open files in running server

(use-package server
  ;; Loads after 2 second of idle time.
  :defer 2
  :config
  (unless (server-running-p)
    (server-start)))

(provide 'setup-emacs-server)
