(require 'use-package)

(use-package yaml-mode
  :ensure
  :commands yaml-mode
  :hook (yaml-mode . flycheck-mode))

(provide 'setup-yaml-mode)
