(require 'use-package)

(use-package smartparens
  :ensure
  :custom
  (sp-autoescape-string-quote nil)
  :hook ((emacs-lisp-mode groovy-mode java-mode js-mode markdown-mode restclient-mode ruby-mode scala-mode) . turn-on-smartparens-mode))

(provide 'setup-smartparens)
