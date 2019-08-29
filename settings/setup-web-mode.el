(require 'use-package)

(use-package web-mode
  :ensure
  :commands web-mode
  :mode "\\.s?css\\'\\|\\.html\\'"
  :custom
  (web-mode-markup-indent-offset 2)
  (web-mode-css-indent-offset 2)
  (web-mode-code-indent-offset 2))

(use-package css-eldoc
  :ensure
  :after web-mode
  :commands web-mode
  :hook (web-mode . turn-on-css-eldoc))

(provide 'setup-web-mode)
