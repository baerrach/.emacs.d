(require 'use-package)

;; Use
;; "C-c C-p" to enable editing of grep buffer
;; "C-c C-c" to write finish editing and and write changes to files
;; "C-c C-k" to abort

(use-package wgrep-ag
  :hook (ag-mode-hook . wgrep-ag-setup)
  )

(provide 'setup-wgrep-ag)
