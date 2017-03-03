;;; setup-yaml-mode

(add-hook 'yaml-mode-hook (lambda () (flycheck-mode 1)))

(provide 'setup-yaml-mode)
