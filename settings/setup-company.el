(require 'use-package)

(use-package company
  :ensure
  :commands (company-mode company-indent-or-complete-common)
  :hook (after-init . global-company-mode)
  :bind (("C-/" . company-complete)
         :map company-active-map
         ("M-n" . nil)
         ("M-p" . nil)
         ("C-n" . company-select-next)
         ("C-p" . company-select-previous))
  :custom
  (company-dabbrev-downcase nil "Replacement text should not be downcased, it should use the case of the text it matched")
  (company-idle-delay nil "only show company on manual invocation"))

(provide 'setup-company)
