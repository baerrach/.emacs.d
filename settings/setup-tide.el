(require 'use-package)

;;; Example jscconfig file
;; See https://code.visualstudio.com/docs/languages/jsconfig
;; {
;;   "compilerOptions": {
;;     "target": "es6",
;;     "checkJs": true,
;;     "experimentalDecorators": true,
;;
;;   },
;;   "include": [
;;     "src/**/*"
;;   ],
;;   "exclude": [
;;     "node_modules"
;;   ]
;; }

(use-package tide
  :commands tide
  :after (js2-mode company flycheck)
  :hook ((js2-mode . bae-setup-tide-mode))
  :config
  (defun bae-setup-tide-mode ()
    (tide-setup)
    (tide-hl-identifier-mode 1)
    (eldoc-mode 1)))

(provide 'setup-tide)
