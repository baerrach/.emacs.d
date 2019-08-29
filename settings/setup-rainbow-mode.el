(require 'use-package)

(use-package rainbow-mode
  :ensure
  :hook ((web-mode . rainbow-mode)
         (js2-mode . rainbow-mode)))

(provide 'setup-rainbow-mode)
