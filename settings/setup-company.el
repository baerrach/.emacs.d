(require 'use-package)

(use-package company
  :diminish
  :commands (company-mode company-indent-or-complete-common)
  :hook (after-init . global-company-mode)
  :bind (("C-/" . company-complete)
         :map company-active-map
         ("M-n" . nil)
         ("M-p" . nil)
         ("C-n" . company-select-next)
         ("C-p" . company-select-previous))
  :custom
  (company-dabbrev-code-everywhere t)
  (company-dabbrev-other-buffers nil "Only search the current buffer to get suggestions for. Too many buffers causes lag")
  (company-dabbrev-downcase nil "Replacement text should not be downcased, it should use the case of the text it matched")
  (company-dabbrev-ignore-case "Replacement text should match candidate, even if prefix is different")
  (company-idle-delay nil "only show company on manual invocation")
  (company-frontends '(company-pseudo-tooltip-frontend
                       company-echo-metadata-frontend) "always show tooltip")
  (completion-styles '(substring partial-completion emacs22))
  :config
  (require 'company-dabbrev-code)
  ;; See https://github.com/company-mode/company-mode/issues/360#issuecomment-366937880
  ;; Must add mode to company-dabbrev-code-modes for company-dabbrev-code-everywhere to work
  (add-to-list 'company-dabbrev-code-modes 'markdown-mode))

(provide 'setup-company)
