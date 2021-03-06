(require 'use-package)

(use-package web-mode
  :commands web-mode
  :mode "\\.s?css\\'\\|\\.html\\'"
  :custom
  (web-mode-markup-indent-offset 2)
  (web-mode-css-indent-offset 2)
  (web-mode-code-indent-offset 2))

(provide 'setup-web-mode)
