(require 'use-package)

;; Dependencies
; https://www.sqlite.org/download.html

(use-package org-roam
  :after (emacsql emacsql-sqlite)
  :custom
;  (org-roam-database-connector 'sqlite-builtin)
  (org-roam-directory "D:/wiki")
  :config
  (add-to-list 'company-backends 'company-capf)
  (org-roam-db-autosync-mode)
)

(provide 'setup-org-roam)
