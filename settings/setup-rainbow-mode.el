(require 'use-package)

(use-package rainbow-mode
  :ensure
  :diminish
  :hook ((web-mode . rainbow-mode)
         (js2-mode . rainbow-mode)))

(provide 'setup-rainbow-mode)
