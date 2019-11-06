(require 'use-package)

(use-package css-eldoc
  :after web-mode
  :commands web-mode
  :hook (web-mode . turn-on-css-eldoc))

(provide 'setup-css-eldoc)
