(require 'dash)

;; friendly font
(when window-system
  (setq bae/default-font "-outline-Consolas-normal-normal-normal-mono-16-*-*-*-c-*-iso8859-1")
  (set-face-attribute 'default nil :font bae/default-font))

;; When running in Windows, we use an Git Bash as alternate shell
(setq explicit-shell-file-name "bash")
(setq shell-file-name explicit-shell-file-name)
(setq tramp-encoding-shell explicit-shell-file-name)
(setenv "SHELL" "bash")
(setq explicit-bash-args '("--noediting" "-i"))
(setq w32-quote-process-args ?\")
(setenv "PATH"
    (concat ".:/usr/local/bin:/mingw/bin:/bin:"
        (replace-regexp-in-string " " "\\\\ "
            (replace-regexp-in-string "\\\\" "/"
                (replace-regexp-in-string "\\([A-Za-z]\\):" "/\\1"
                    (getenv "PATH"))))))

(provide 'microsoft-windows)
