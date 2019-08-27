(require 'use-package)

(use-package string-inflection
  :ensure
  :bind (("C-c C-u" . string-inflection-all-cycle)))

(provide 'setup-string-inflection)
