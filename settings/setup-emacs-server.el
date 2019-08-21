(require 'server)
(unless (server-running-p)
  (server-start))
;; Use emacsclientw.exe to open files in running server

(provide 'setup-emacs-server)
