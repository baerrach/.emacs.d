(require 'use-package)

(use-package simplezen
  :ensure
  :bind (("C-c C-z" . simplezen-expand )))

(provide 'setup-simplezen)
