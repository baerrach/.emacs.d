(autoload 'auto-complete-mode "auto-complete" nil t)
(require 'auto-complete-config)
(ac-config-default)

(add-to-list 'ac-sources 'ac-source-yasnippet)

(provide 'setup-ac-mode)
