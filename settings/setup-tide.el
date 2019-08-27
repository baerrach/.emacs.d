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
  :ensure
  :after (js2-mode company flycheck)
  :hook ((js2-mode . tide-setup)
         (js2-mode . tide-hl-identifier-mode)))

(provide 'setup-tide)
