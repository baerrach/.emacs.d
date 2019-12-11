(require 'use-package)

(use-package smartparens
  :diminish
  :hook ((emacs-lisp-mode groovy-mode java-mode js-mode markdown-mode restclient-mode ruby-mode scala-mode) . turn-on-smartparens-mode)
  :bind (("C-<down>" . sp-down-sexp)
         ("C-<up>" . sp-up-sexp)
         ("C-<left>" . sp-forward-sexp)
         ("C-<right>" . sp-backward-sexp)
         ("C-M-f" . sp-forward-sexp)
         ("C-M-b" . sp-backward-sexp)
         )
  :custom
  (sp-autoescape-string-quote nil)

(provide 'setup-smartparens)
