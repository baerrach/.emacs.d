;;; setup-js2-mode.el --- tweak js2 settings -*- lexical-binding: t; -*-

(use-package js2-mode
  :ensure
  :commands js2-mode
  :delight js2-mode "JS2"
  :custom
  (js-indent-level 2)
  (js2-allow-rhino-new-expr-initializer nil)
  (js2-auto-indent-p nil)
  (js2-enter-indents-newline nil)
  (js2-global-externs '("module" "require"))
  (js2-idle-timer-delay 0.1)
  (js2-indent-on-enter-key nil)
  (js2-mirror-mode nil)
  (js2-strict-inconsistent-return-warning nil)
  (js2-auto-indent-p t)
  (js2-include-rhino-externs nil)
  (js2-include-gears-externs nil)
  (js2-concat-multiline-strings 'eol)
  (js2-rebind-eol-bol-keys nil)
  ;; Let flycheck handle parse errors
  (js2-show-parse-errors nil)
  (js2-strict-missing-semi-warning nil)
  (js2-strict-trailing-comma-warning nil)
  :config
  )

(use-package js2-imenu-extras
  :ensure nil ; part of js2-mode
  :after js2-mode
  :commands js2-mode
  :config
  (js2-imenu-extras-setup))

(use-package js2-refactor
  :ensure
  :after js2-mode
  :commands js2-mode
  :bind (:map js2-mode-map
              ("C-k" . js2r-kill)))

(defun bae-disable-js2-mode-helpers ()
  "Disable Flycheck, Prettier, WS-butler"
  (interactive)
  (progn
    (flycheck-mode -1)
    (prettier-js-mode -1)
    (ws-butler-mode -1)))

(provide 'setup-js2-mode)
