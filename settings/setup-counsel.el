(require 'use-package)

(use-package counsel
  :after (ivy)
  :diminish
  :bind (("C-x F" . counsel-recentf))
  :config
  (counsel-mode 1))

(provide 'setup-counsel)
