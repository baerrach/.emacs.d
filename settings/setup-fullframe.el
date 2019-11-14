(require 'use-package)

(use-package fullframe
  :after (magit)
  :config
  (fullframe magit-status magit-mode-quit-window))

(provide 'setup-fullframe)
