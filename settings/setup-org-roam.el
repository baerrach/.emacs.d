(require 'use-package)

;; Dependencies
; https://www.sqlite.org/download.html

(use-package org-roam
  :after (emacsql emacsql-sqlite hydra)
  :bind (("C-c h r" . hydra-org-roam/body)
         )
  :custom
;  (org-roam-database-connector 'sqlite-builtin)
  (org-roam-directory "D:/wiki")
  :config
  (add-to-list 'company-backends 'company-capf)
  (org-roam-db-autosync-mode)
  (defhydra hydra-org-roam (:hint nil)
    "
 [_i_] Insert
 [_f_] Find
 [_c_] Capture

 [_t_] Buffer toggle (show current buffer)
 [_b_] Buffer dedicated (choose node name)
 [_q_] Quit"
    ("i" org-roam-node-insert)
    ("f" org-roam-node-find)
    ("c" org-roam-capture)
    ("t" org-roam-buffer-toggle)
    ("b" org-roam-buffer-display-dedicated)
    ("q" nil))
)


(provide 'setup-org-roam)
