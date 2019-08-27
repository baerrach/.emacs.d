(require 'use-package)

(use-package prettier-js
  :after add-node-modules-path
  :commands prettier-js-mode
  :hook ((js2-mode js2-jsx-mode) . bae/maybe-use-prettier)
  :config
  (defun bae/maybe-use-prettier ()
    "Enable prettier-js-mode if an rc file is located."
    (interactive)
    (let* ((prettier-disabled (or (string-match-p (regexp-quote "node_modules") buffer-file-name)
                                  (string-match-p (regexp-quote "vendor") buffer-file-name)
                                  (string-match-p (regexp-quote "_template") buffer-file-name)))
           (has-prettierrc (locate-dominating-file buffer-file-name ".prettierrc.js"))
           (enable-prettier (and has-prettierrc (not prettier-disabled))))
      (when enable-prettier
        (add-node-modules-path)
        (prettier-js-mode 1)))))

(provide 'setup-prettier-js)
