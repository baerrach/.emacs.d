(require 'use-package)

(use-package autorevert
  ;; Loads after 1 second of idle time.
  :defer 1
  :custom
  ;; Also auto refresh dired, but be quiet about it
  (global-auto-revert-non-file-buffers t)
  (auto-revert-verbose nil)
  :config
  ;; Auto refresh buffers
  (global-auto-revert-mode 1))

(provide 'setup-autorevert)
