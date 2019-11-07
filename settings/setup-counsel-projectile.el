(require 'use-package)

(use-package counsel-projectile
  :after counsel projectile
  :config
  (counsel-projectile-mode 1))

(provide 'setup-counsel-projectile)
