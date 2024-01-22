(require 'use-package)

;; nXML
(use-package nxml
  :commands nxml-mode
  :custom
  (nxml-child-indent 4)
  (nxml-attribute-indent 4)
  :config
  )

(provide 'setup-nxml-mode)
