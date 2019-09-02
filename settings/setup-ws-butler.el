(require 'use-package)

(use-package ws-butler
  :ensure
  :diminish
  :custom
  (ws-butler-keep-whitespace-before-point nil)
  (ws-butler-trim-predicate (lambda (beg end)
                              (not (eq 'font-lock-string-face
                                       (get-text-property end 'face)))))
  :config
  (ws-butler-global-mode t))

(provide 'setup-ws-butler)
