(require 'use-package)

;;; Dependencies
;; See https://www.sqlite.org/download.html

(use-package org-roam
  :after (emacsql emacsql-sqlite hydra)
  :bind (("C-c h r" . hydra-org-roam/body)
         )
  ;; Don't set this via :custom, it needs to be different across Emacs installations
  ;; Use custom: instead user M-X customize-variable so the values are stored in ~/.emacs.d/custom.el
  ; (org-roam-directory "use M-x customize-variable instead")
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
