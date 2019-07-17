(require 'prettier-js)

(add-hook 'js2-mode-hook #'add-node-modules-path)
(add-hook 'js2-jsx-mode-hook #'add-node-modules-path)

(defun bae/maybe-use-prettier ()
  "Enable prettier-js-mode if an rc file is located."
  (interactive)
  (let* ((prettier-disabled (or (string-match-p (regexp-quote "node_modules") buffer-file-name)
                                (string-match-p (regexp-quote "vendor") buffer-file-name)
                                (string-match-p (regexp-quote "_template") buffer-file-name)))
         (has-prettierrc (locate-dominating-file buffer-file-name ".prettierrc.js"))
         (enable-prettier (and has-prettierrc (not prettier-disabled))))
    (when enable-prettier
      (prettier-js-mode 1))))

(add-hook 'js2-mode-hook 'bae/maybe-use-prettier)
(add-hook 'js2-jsx-mode-hook 'bae/maybe-use-prettier)

(provide 'setup-prettier-js)
