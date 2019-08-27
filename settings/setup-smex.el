(require 'use-package)

;; Smart M-x
(use-package smex
  :ensure
  :commands smex
  :bind (
         ("M-x" . smex)
         ("M-X" . smex-major-mode-commands)
         ("C-c C-c M-x" . execute-extended-command) ; The old M-x command
         ))

(provide 'setup-smex)
