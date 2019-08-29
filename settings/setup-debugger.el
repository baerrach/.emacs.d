(require 'use-package)

(use-package debug
  :ensure nil
  :hook (debugger-mode . turn-on-visual-line-mode))

(provide 'setup-debugger)
