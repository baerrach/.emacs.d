(require 'use-package)

(use-package beacon
  :ensure
  :diminish
  :custom
  (beacon-color "#d33682")
  :config
  (beacon-mode 1))

(provide 'setup-beacon)
