(require 'use-package)

(use-package smartparens
  ;; Loads after 1 second of idle time.
  :defer 1
  :diminish
  :hook ((emacs-lisp-mode groovy-mode java-mode js-mode markdown-mode restclient-mode ruby-mode scala-mode) . turn-on-smartparens-mode)
  :bind (("C-<down>" . sp-up-sexp)
         ("C-<up>" . sp-down-sexp)
         ("C-<left>" . sp-backward-sexp)
         ("C-<right>" . sp-forward-sexp)
         ("C-M-f" . sp-forward-sexp)
         ("C-M-b" . sp-backward-sexp))
  :custom
  (sp-autoescape-string-quote nil)
  :config
  (sp-local-pair 'markdown-mode "'" nil :actions '(:rem insert))
  (sp-local-pair 'markdown-mode "`" nil :actions '(:rem insert)))

(provide 'setup-smartparens)
