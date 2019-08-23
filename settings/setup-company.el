(require 'use-package)

(use-package company
  :custom
  (company-dabbrev-downcase nil "Replacement text should not be downcased, it should use the case of the text it matched")
  :hook (after-init-hook . global-company-mode))

(provide 'setup-company)
