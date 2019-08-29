(require 'use-package)

(use-package rjsx-mode
  :ensure
  :commands rjsx-mode
  :mode "\\.jsx'"
  :magic "#!/usr/bin/env node")

(provide 'setup-rjsx-mode)
