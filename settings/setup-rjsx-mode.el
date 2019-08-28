(require 'use-package)

(use-package rjsx-mode
  :ensure
  :mode "\\.jsx'"
  :magic "#!/usr/bin/env node")

(provide 'setup-rjsx-mode)
