(require 'use-package)

(use-package visual-regexp
  :ensure
  :bind (("C-c q" . vr/query-replace)
         ("C-c C-q" . vr/query-replace)
         ;; if you use multiple-cursors, this is for you:
         ("C-c m" . vr/mc-mark)))

(provide 'setup-visual-regexp)
