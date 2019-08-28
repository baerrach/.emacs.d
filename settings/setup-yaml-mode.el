(require 'use-package)

(use-package yaml-mode
  :ensure
  :commands yaml-mode
  :mode "\\.yml'"
  :hook (yaml-mode . flycheck-mode))

(provide 'setup-yaml-mode)
