(require 'use-package)

(use-package guide-key
  :ensure
  :diminish
  :hook ((org-mode . bae-guide-keys-for-org-mode)
         (projectile-mode . bae-guide-keys-for-projectile-mode))
  :custom
  (guide-key/guide-key-sequence '("C-c h") "Guide Key for Hyrda heads")
  (guide-key/popup-window-position 'bottom)
  :config
  (defun bae-guide-keys-for-org-mode ()
    (guide-key/add-local-guide-key-sequence "C-c")
    (guide-key/add-local-guide-key-sequence "C-c C-x")
    (guide-key/add-local-highlight-command-regexp "org-"))
  (defun bae-guide-keys-for-projectile-mode ()
    (guide-key/add-local-guide-key-sequence "C-c")
    (guide-key/add-local-guide-key-sequence "C-c C-p")
    (guide-key/add-local-highlight-command-regexp "projectile-"))

  (guide-key-mode 1))

(provide 'setup-guide-key)
