(require 'use-package)

(use-package olivetti
  :commands markdown-mode
  :mode "\\.md\\'"
  :custom
  (olivetti-body-width fill-column))

(provide 'setup-olivetti)
