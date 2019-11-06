(require 'use-package)

(use-package highlight-escape-sequences
  :init
  (put 'font-lock-regexp-grouping-backslash 'face-alias 'font-lock-builtin-face)
  :config
  (hes-mode))

(provide 'setup-highlight-escape-sequences)
