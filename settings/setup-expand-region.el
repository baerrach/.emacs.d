(require 'use-package)

(use-package expand-region
  :ensure
  :bind (;; Expand region (increases selected region by semantic units)
         ("C-'" . 'er/expand-region)))

(provide 'setup-expand-region)
