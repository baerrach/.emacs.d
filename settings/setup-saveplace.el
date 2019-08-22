(require 'use-package)

(use-package saveplace
  :ensure
  :custom
  (save-place t "Save point position between sessions"))

(provide 'setup-saveplace)
