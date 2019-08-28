(require 'use-package)

(use-package browse-kill-ring
  :ensure
  :bind ("C-x C-y" . browse-kill-ring))

(provide 'setup-browse-kill-ring)
