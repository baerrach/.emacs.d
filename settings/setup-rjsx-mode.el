(require 'use-package)

(use-package rjsx-mode
  :commands rjsx-mode
  :mode "\\.jsx'"
  :magic "#!/usr/bin/env node")

(provide 'setup-rjsx-mode)
