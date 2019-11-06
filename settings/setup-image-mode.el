(require 'use-package)

(straight-use-package '(image-mode :type built-in))

(use-package image-mode
  :mode "\\.svg'")

(provide 'setup-image-mode)
