(require 'dash)

;; friendly font
(when window-system
  (setq bae/default-font "-outline-Consolas-normal-normal-normal-mono-36-*-*-*-c-*-iso8859-1")
  (set-face-attribute 'default nil :font bae/default-font)
  (set-face-attribute 'mode-line nil :font bae/default-font))

;; When running in Windows, we use Git Bash as alternate shell
(setq explicit-shell-file-name "C:/Program Files/Git/bin/bash.exe")
(setq shell-file-name explicit-shell-file-name)
;; Tramp is used by magit
(setq tramp-encoding-shell "C:/Program Files/Git/bin/bash.exe")
(setenv "SHELL" "bash")
(setq explicit-bash.exe-args '("--noediting" "-i"))
(setq w32-quote-process-args ?\")
(setq null-device "/dev/null")

;;
;; After saving file,
;; revert-buffer-with-coding-system windows-1250
;; To handle smart quotes
;; Not sure how to force that
;;

(defun use-unix-file-coding-system ()
  (let ((coding-str (symbol-name buffer-file-coding-system)))
    (when (and (boundp 'force-use-unix-file-coding-system) force-use-unix-file-coding-system)
        (set-buffer-file-coding-system (intern coding-str)))))

;; (add-hook 'find-file-hooks 'use-unix-file-coding-system)

(provide 'microsoft-windows)
