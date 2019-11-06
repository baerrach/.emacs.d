(require 'use-package)

(use-package ag
  :custom
  (ag-highlight-search t)
  :config
  (advice-add 'rgrep :override 'ag))

(provide 'setup-ag)
