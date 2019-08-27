(require 'use-package)

(use-package ruby-mode
  :ensure
  :after string-inflection
  :commands (ruby-mode)
  :bind (:map ruby-mode-map
              ("C-c C-u" . string-inflection-ruby-style-cycle))
  :custom
  (ruby-deep-indent-paren nil "avoid ridiculous ruby indentation"))

(provide 'setup-ruby-mode)
