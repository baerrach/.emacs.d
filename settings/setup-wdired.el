(require 'use-package)

(use-package wdired
  :ensure
  :after dired
  :config
  (advice-add 'wdired-abort-changes :after #'dired-revert-buffer--reload-after-changes))

(provide 'setup-wdired)
