(require 'use-package)

(use-package counsel
  :ensure
  :after ivy
  :diminish
  :config
  (counsel-mode 1))

(provide 'setup-counsel)
