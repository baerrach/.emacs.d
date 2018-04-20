(require 'indium)

(setq indium-nodejs-inspect-brk nil)

;; selenium-utils needs the REPL environment set to something to run the debug
;; REPL loop.
(setenv "REPL" "1")

(defun bae/indium-backend-evaluate (orig-indium-backend-evaluate backend string &optional callback)
  (when (string-match-p "^\\(const\\|let\\)\\W*" string)
    (setq string (replace-regexp-in-string "^\\(const\\|let\\)\\W*" "" string)))

  (when (string-match-p "^\\(\\w+\\W*=\\)?\\W*await" string)
    (message "Wrapping javascript in async block")
    (setq string (format "(async () => {%s; console.log('Wrapped async completed.');})();" string)))

  (funcall orig-indium-backend-evaluate backend string callback)
  )

(advice-add 'indium-backend-evaluate :around #'bae/indium-backend-evaluate)

(add-hook 'js2-mode-hook #'indium-interaction-mode)

(provide 'setup-indium)