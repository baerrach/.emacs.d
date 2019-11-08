(require 'use-package)

(use-package wdired
  :after (dired)
  :bind (:map wdired-mode-map
              ("C-a" . dired-back-to-start-of-files)
              ([remap beginning-of-buffer] . dired-back-to-top)
              ([remap end-of-buffer] . dired-jump-to-bottom))
  :config
  (advice-add 'wdired-abort-changes :after #'dired-revert-buffer--reload-after-changes))

(provide 'setup-wdired)
