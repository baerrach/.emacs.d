(require 'use-package)

(use-package avy
  :ensure
  :bind (("C-c C-j" . avy-resume)
         ("C-c <SPC>" . avy-goto-char)
         :map isearch-mode-map
              ("C-'" . avy-isearch)))

(provide 'setup-avy)
