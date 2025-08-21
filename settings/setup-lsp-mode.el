(require 'use-package)

(use-package lsp-mode
  :commands lsp-mode
  :hook ((lsp-after-open . lsp-enable-imenu))
  )

(use-package lsp-ui
  :after (lsp-mode)
  :custom
  (lsp-ui-sideline-ignore-duplicate t))

;; (use-package company-lsp
;;   :ensure
;;   :after (lsp-mode company)
;;   :config
;;   (push 'company-lsp company-backends))

(provide 'setup-lsp-mode)
