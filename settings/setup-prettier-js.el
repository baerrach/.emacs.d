(require 'prettier-js)

(add-hook 'js2-mode-hook #'add-node-modules-path)
(add-hook 'js2-jsx-mode-hook #'add-node-modules-path)

(add-hook 'js2-mode-hook 'prettier-js-mode)
(add-hook 'js2-jsx-mode-hook 'prettier-js-mode)

(provide 'setup-prettier-js)
