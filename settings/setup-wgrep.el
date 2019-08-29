(require 'use-package)

;; Use
;; "C-c C-p" to enable editing of grep buffer
;; "C-c C-c" to write finish editing and and write changes to files
;; "C-c C-k" to abort

(use-package wgrep
  :ensure
  :commands wgrep
  :custom
  (wgrep-auto-save-buffer t))

(provide 'setup-wgrep)
