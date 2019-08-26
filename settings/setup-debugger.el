(require 'use-package)

(use-package debug
  :hook (debugger-mode . turn-on-visual-line-mode))

(provide 'setup-debugger)
