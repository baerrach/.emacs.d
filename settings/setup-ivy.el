(require 'use-package)

(use-package ivy
  :ensure
  :custom
  (ivy-use-virtual-buffers t)
  (enable-recursive-minibuffers t)
  :config
  (ivy-mode 1))

(provide 'setup-ivy)
