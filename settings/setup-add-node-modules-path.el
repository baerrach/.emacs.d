(require 'use-package)

(use-package add-node-modules-path
  :ensure
  :hook ((js2-mode js2-jsx-mode) . add-node-modules-path))

(provide 'setup-add-node-modules-path)
