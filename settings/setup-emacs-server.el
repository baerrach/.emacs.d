(require 'use-package)

;; Use emacsclientw.exe to open files in running server

(use-package server
  :ensure nil
  :config
  (unless (server-running-p)
    (server-start)))

(provide 'setup-emacs-server)
