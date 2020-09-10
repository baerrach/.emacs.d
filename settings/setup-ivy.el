(require 'use-package)

(use-package ivy
  ;; Loads after 1 second of idle time.
  :defer 1
  :diminish
  :custom
  (enable-recursive-minibuffers t)
  (ivy-count-format "(%d/%d) " "Disply both index and the count")
  :config
  (ivy-mode 1))

(provide 'setup-ivy)
