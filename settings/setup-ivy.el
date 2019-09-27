(require 'use-package)

(use-package ivy
  :ensure
  :diminish
  :custom
  (enable-recursive-minibuffers t)
  (ivy-count-format "(%d/%d) " "Disply both index and the count")
  :config
  (ivy-mode 1))

(provide 'setup-ivy)
