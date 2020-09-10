(require 'use-package)

;; Use emacs to edit text boxes in Chrome or Firefox
;; See https://github.com/stsquad/emacs_chrome
;; Need to install browser extensions

(use-package edit-server
  :defer 5
  :config
  (edit-server-start))

(provide 'setup-edit-server)
