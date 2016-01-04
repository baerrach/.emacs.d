(require 'dash)

;; friendly font
(when window-system
  (setq bae/default-font "-outline-Consolas-normal-normal-normal-mono-16-*-*-*-c-*-iso8859-1")
  (set-face-attribute 'default nil :font bae/default-font))

;; When running in Windows, we use Git Bash as alternate shell
(setq explicit-shell-file-name "C:/Program Files/Git/bin/bash.exe")
(setq shell-file-name explicit-shell-file-name)
;; Tramp is used by magit
(setq tramp-encoding-shell "C:/Program Files/Git/bin/bash.exe")
(setenv "SHELL" "bash")
(setq explicit-bash.exe-args '("--noediting" "-i"))
(setq w32-quote-process-args ?\")
(setq null-device "/dev/null")

;; Disable flycheck on windows its broken
(setq global-flycheck-mode -1)

(provide 'microsoft-windows)
