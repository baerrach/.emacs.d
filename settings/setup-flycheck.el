(require 'use-package)

;; flycheck-start-command-checker start of instrumentation
;; flycheck-process-send-buffer where next problem is
;; - chunking works fine
;; process-send-eof process is failing
;; flycheck-jav... 13240   run     --              --           c:/ide/frontend/node_modules/.bin/eslint.cmd --format=json --stdin --stdin-filename c:/ide/frontend/src/views/pages/station/data-view.js
;; flycheck-jav... 13240   run     --              --           c:\ide\frontend\node_modules\.bin\eslint.cmd --format=json --stdin --stdin-filename c:\ide\frontend\src\views\pages\station\data-view.js


; (setq flycheck-xml-parser 'flycheck-parse-xml-region))

; (setq flycheck-check-syntax-automatically '(save))

(use-package flycheck
  :ensure
  :after (flycheck-pos-tip js2-mode add-node-modules-path)
  :commands (flycheck-mode flycheck-next-error flycheck-previous-error)
  :hook ((flycheck-after-syntax-check . magnars/adjust-flycheck-automatic-syntax-eagerness)
         (flycheck-mode . bae/disable-flycheck-for-buffer)
         (flycheck-mode . my/use-eslint-from-node-modules)
         (js2-mode . bae-flycheck-mode))
  :custom
  (flycheck-check-syntax-automatically '(save idle-change mode-enabled) "Remove newline checks, since they would trigger an immediate check when we want the idle-change-delay to be in effect while editing")
  (flycheck-disabled-checkers '(json-jsonlist emacs-lisp-checkdoc) "always disable these checkers")
  (flycheck-disabled-checkers (append flycheck-disabled-checkers '(javascript-jshint)) "disable jshint since we prefer eslint checking")
  (flycheck-disabled-checkers (append flycheck-disabled-checkers '(javascript-tide)) "disable tide since we prefer eslint checking")
  (flycheck-display-errors-function #'flycheck-pos-tip-error-messages)
  (flycheck-temp-prefix ".flycheck" "customize flycheck temp file prefix")
  (flycheck-xml-parser 'flycheck-parse-xml-region)
  ;; See
  ;; * https://github.com/flycheck/flycheck/issues/1529
  ;; * https://github.com/nodejs/node/issues/4697
  ;; Node fails at 4096 bytes when reading Windows stdin.
  ;; When fixed update https://stackoverflow.com/questions/54406400/flycheck-eslint-on-emacs-doesnt-work-invalid-argument-flycheck-javascript-esl
  (flycheck-chunked-process-input t)
  :config
  (defun bae-flycheck-mode ()
    "Enable Flycheck after calling add-node-modules-path."
    (add-node-modules-path)
    (flycheck-mode 1))

  (defun bae/disable-flycheck-for-buffer ()
    "Some files (like in node_modules) are not written by us and should
not be checked"
    (if (or (string-match-p (regexp-quote "node_modules") buffer-file-name)
            (string-match-p (regexp-quote "vendor") buffer-file-name)
            (string-match-p (regexp-quote "_template") buffer-file-name))
        (flycheck-disable-checker 'javascript-eslint)))

  (defun magnars/adjust-flycheck-automatic-syntax-eagerness ()
    "Adjust how often we check for errors based on if there are any.

This lets us fix any errors as quickly as possible, but in a
clean buffer we're an order of magnitude laxer about checking."
    (setq flycheck-idle-change-delay
          (if flycheck-current-errors 0.5 30.0)))

  (defun flycheck-handle-idle-change ()
    "Handle an expired idle time since the last change.

This is an overwritten version of the original
flycheck-handle-idle-change, which removes the forced deferred.
Timers should only trigger inbetween commands in a single
threaded system and the forced deferred makes errors never show
up before you execute another command."
    (flycheck-clear-idle-change-timer)
    (flycheck-buffer-automatically 'idle-change))

  ;; https://emacs.stackexchange.com/a/21207/12751
  (defun my/use-eslint-from-node-modules ()
    (let* ((root (locate-dominating-file
                  (or (buffer-file-name) default-directory)
                  "node_modules"))
           (eslint (and root
                        (expand-file-name "node_modules/.bin/eslint.cmd"
                                          root))))
      (when (and eslint (file-exists-p eslint))
        (setq-local flycheck-javascript-eslint-executable eslint))))

  ;; Each buffer gets its own idle-change-delay because of the
  ;; buffer-sensitive adjustment above.
  (make-variable-buffer-local 'flycheck-idle-change-delay))

(provide 'setup-flycheck)
