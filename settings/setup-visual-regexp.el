(require 'use-package)

(use-package visual-regexp
  :ensure
  :bind (("C-c r" . vr/replace)
         ("C-c q" . vr/query-replace)
         ;; if you use multiple-cursors, this is for you:
         ("C-c m" . vr/mc-mark)))

(provide 'setup-visual-regexp)
