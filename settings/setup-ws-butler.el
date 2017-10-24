(require 'ws-butler)

(setq ws-butler-trim-predicate
      (lambda (beg end)
        (not (eq 'font-lock-string-face
                 (get-text-property end 'face)))))

(setq ws-butler-keep-whitespace-before-point nil)

(ws-butler-global-mode t)

(provide 'setup-ws-butler)
