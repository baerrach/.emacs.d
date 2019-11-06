(require 'use-package)

;; Smart M-x Alternative
(use-package amx
  :bind (("M-x" . amx))
  :config
  (amx-mode))

(provide 'setup-amx)
