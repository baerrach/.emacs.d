(require 'use-package)

(use-package beacon
  :diminish
  :custom
  (beacon-color "#d33682")
  :config
  (beacon-mode 1))

(provide 'setup-beacon)
