(require 'company)

(add-hook 'after-init-hook 'global-company-mode)

;; Replacement text should not be downcased, it should use the case of the text
;; it matched
(setq company-dabbrev-downcase nil)

(provide 'setup-company)
