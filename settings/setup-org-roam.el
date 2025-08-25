(require 'use-package)

;;; Dependencies
;; See https://www.sqlite.org/download.html

(use-package org-roam
  :after (emacsql emacsql-sqlite)
  ;; Don't set this via :custom, it needs to be different across Emacs installations
  ;; Use custom instead so ~/.emacs.d/custom.el stores this value
  ; (org-roam-directory "D:/wiki")
  :config
  (add-to-list 'company-backends 'company-capf)
  (org-roam-db-autosync-mode)
)

(provide 'setup-org-roam)
