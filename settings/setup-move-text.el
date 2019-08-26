(require 'use-package)

(use-package move-text
  :ensure
  :bind (("S-M-<down>" . move-text-down)
         ("S-M-<up>" . move-text-up)))

(provide 'setup-move-text)
