(require 'use-package)

(use-package ag
  :defer 5 ;;; defer loading ag after N seconds of idle time
  :custom
  (ag-highlight-search t)
  :config
  (advice-add 'rgrep :override 'ag))

(provide 'setup-ag)
