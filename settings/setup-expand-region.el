(require 'use-package)

(use-package expand-region
  :after (org)
  :bind (;; Expand region (increases selected region by semantic units)
         ("C-'" . 'er/expand-region)))

(provide 'setup-expand-region)
