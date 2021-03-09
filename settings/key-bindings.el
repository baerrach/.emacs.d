;; M-i for back-to-indentation
(global-set-key (kbd "M-i") 'back-to-indentation)

;; Shift-tab for indent-rigidly
(global-set-key (kbd "S-<tab>") 'indent-rigidly)

;; Use shell-like backspace C-h, rebind help to F1
(define-key key-translation-map [?\C-h] [?\C-?])
(global-set-key (kbd "<f1>") 'help-command)
(global-unset-key (kbd "<f1> h")) ;; Don't need view-hello-file

;; Transpose stuff with M-t
(global-unset-key (kbd "M-t")) ;; which used to be transpose-words
(global-set-key (kbd "M-t l") 'transpose-lines)
(global-set-key (kbd "M-t w") 'transpose-words)
(global-set-key (kbd "M-t s") 'transpose-sexps)
(global-set-key (kbd "M-t p") 'transpose-params)

;; Change word separators
(global-unset-key (kbd "C-x +")) ;; used to be balance-windows
(defhydra hydra-string-inflection-region (:color blue :hint nil)
    "
Change string inflection of region
----------------------------------
 ^_u_^ underscore
 ^_-_^ kebab-case
 ^_c_^ lowerCamelCase
 ^_C_^ UpperCamelCase"
    ("u" string-inflection-underscore)
    ("-" string-inflection-kebab-case)
    ("c" string-inflection-lower-camelcase)
    ("C" string-inflection-camelcase)
)
(global-set-key (kbd "C-c h +") 'hydra-string-inflection-region/body)

;; Buffers
(global-set-key (kbd "C-c y") 'bury-buffer)
(global-set-key (kbd "C-c r") 'revert-buffer)
(global-set-key (kbd "C-x C-b") 'ibuffer)

;; Help should search more than just commands
(global-set-key (kbd "<f1> a") 'apropos)

;; Should be able to eval-and-replace anywhere.
(global-set-key (kbd "C-c C-e") 'eval-and-replace)

;; Navigation bindings
(global-set-key [remap goto-line] 'goto-line-with-feedback)

(global-set-key (kbd "M-p") 'backward-paragraph)
(global-set-key (kbd "M-n") 'forward-paragraph)

;; Completion at point
(global-set-key (kbd "C-<tab>") 'completion-at-point)

;; Move more quickly
(global-set-key (kbd "C-S-n") (λ (ignore-errors (next-line 5))))
(global-set-key (kbd "C-S-p") (λ (ignore-errors (previous-line 5))))
(global-set-key (kbd "C-S-f") (λ (ignore-errors (forward-char 5))))
(global-set-key (kbd "C-S-b") (λ (ignore-errors (backward-char 5))))

;; Comment/uncomment block
(global-set-key (kbd "C-c c") 'comment-or-uncomment-region)
(global-set-key (kbd "C-c u") 'uncomment-region)

;; Sorting
(global-set-key (kbd "M-s l") 'sort-lines)

;; I don't need to kill emacs that easily
;; the mnemonic is C-x REALLY QUIT
(global-set-key (kbd "C-x r q") 'save-buffers-kill-terminal)
(global-unset-key (kbd "C-x C-c"))

;; Suspend frame
(global-unset-key (kbd "C-x C-z"))

;; Unbind commands that get invoked accidentally and will never be used.
(global-unset-key (kbd "C-x C-n"))

(provide 'key-bindings)
