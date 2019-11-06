(require 'use-package)

(use-package rainbow-mode
  :diminish
  :hook ((web-mode . rainbow-mode)
         (js2-mode . rainbow-mode)))

(provide 'setup-rainbow-mode)
