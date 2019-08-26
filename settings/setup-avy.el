(require 'use-package)

(use-package avy
  :ensure
  :bind (("C-c C-j" . avy-resume)
         ("C-'" . avy-goto-char-2)
         :map isearch-mode-map
              ("C-'" . avy-isearch)))

(provide 'setup-avy)
