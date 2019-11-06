(require 'use-package)

(use-package smart-forward
  :bind (("M-<up>" . smart-up)
         ("M-<down>" . smart-down)
         ("M-<left>" . smart-backward)
         ("M-<right>" . smart-forward)))

(provide 'setup-smart-forward)
