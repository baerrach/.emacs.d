;;; Example jscconfig file
;;; See https://code.visualstudio.com/docs/languages/jsconfig
;;; {
;;;   "compilerOptions": {
;;;     "target": "es6",
;;;     "checkJs": true,
;;;     "experimentalDecorators": true,
;;;
;;;   },
;;;   "include": [
;;;     "src/**/*"
;;;   ],
;;;   "exclude": [
;;;     "node_modules"
;;;   ]
;;; }

(defun setup-tide-mode ()
  (interactive)
  (tide-setup)
  (eldoc-mode +1)
  (tide-hl-identifier-mode +1)
  ;; company is an optional dependency. You have to
  ;; install it separately via package-install
  ;; `M-x package-install [ret] company`
)

(provide 'setup-tide)
