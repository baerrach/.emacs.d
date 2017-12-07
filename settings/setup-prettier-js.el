(require 'prettier-js)

(setq prettier-js-args
      '(
        "--single-quote"
        "--trailing-comma" "es5"
        ))

(add-hook 'js2-mode-hook 'prettier-js-mode)
(add-hook 'js2-jsx-mode-hook 'prettier-js-mode)

(provide 'setup-prettier-js)
