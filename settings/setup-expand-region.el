(require 'use-package)

(use-package expand-region
  :bind (;; Expand region (increases selected region by semantic units)
         ("C-'" . 'er/expand-region)))

(provide 'setup-expand-region)
