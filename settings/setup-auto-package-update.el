(require 'use-package)

(use-package auto-package-update
  :ensure
  :config
  (setq auto-package-update-delete-old-versions t)
  (setq auto-package-update-hide-results t)
  (auto-package-update-maybe))

(provide 'setup-auto-package-update)
