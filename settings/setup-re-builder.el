(require 'use-package)

(use-package re-builder
  :ensure nil
  :custom
  (reb-re-syntax 'string))

(provide 'setup-re-builder)
