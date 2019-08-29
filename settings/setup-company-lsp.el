(require 'use-package)

(use-package company-lsp
  :ensure
  :after (company lsp-mode)
  :config
  (add-to-list 'company-backends 'company-lsp))

(provide 'setup-company-lsp)
