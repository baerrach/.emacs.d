(require 'use-package)

(use-package ivy
  :ensure
  :diminish
  :custom
  (ivy-use-virtual-buffers t "Add recent files and bookmarks to ivy-switch-buffer")
  (enable-recursive-minibuffers t)
  (ivy-count-format "(%d/%d) " "Disply both index and the count")
  :config
  (ivy-mode 1))

(provide 'setup-ivy)
