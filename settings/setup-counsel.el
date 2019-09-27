(require 'use-package)

(use-package counsel
  :ensure
  :after ivy
  :diminish
  :bind (("C-x F" . counsel-recentf))
  :config
  (counsel-mode 1))

(provide 'setup-counsel)
