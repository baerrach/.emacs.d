(require 'lsp-mode)

(add-hook 'lsp-after-open-hook 'lsp-enable-imenu)

(lsp-register-client
 (make-lsp-client :new-connection (lsp-stdio-connection "pyls")
                  :major-modes '(python-mode)
                  :server-id 'pyls))

;; make sure this is activated when python-mode is activated
;; lsp-python-enable is created by macro above
(add-hook 'python-mode-hook #'lsp)

;; lsp extras
(require 'lsp-ui)
(setq lsp-ui-sideline-ignore-duplicate t)

(require 'company-lsp)
(push 'company-lsp company-backends)

;; NB: only required if you prefer flake8 instead of the default
;; send pyls config via lsp-after-initialize-hook -- harmless for
;; other servers due to pyls key, but would prefer only sending this
;; when pyls gets initialised (:initialize function in
;; lsp-define-stdio-client is invoked too early (before server
;; start)) -- cpbotha

;; (defun lsp-set-cfg ()
;;   (let ((lsp-cfg `(:pyls (:configurationSources ("flake8")))))
;;     ;; TODO: check lsp--cur-workspace here to decide per server / project
;;     (lsp--set-configuration lsp-cfg)))

;; (add-hook 'lsp-after-initialize-hook 'lsp-set-cfg))

(provide 'setup-lsp)
