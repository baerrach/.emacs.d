(when (equal system-type 'windows-nt)
  ;; When running in Windows, we use Git Bash as alternate shell
  ;; See M-x describe-function shell for full details on these variables
  (setq explicit-shell-file-name "C:/Program Files/Git/bin/bash.exe")
  (setq shell-file-name explicit-shell-file-name)
  (setq explicit-bash.exe-args '("--noediting" "--login" "-i"))
  ;; Tramp is used by magit
  (setq tramp-encoding-shell "C:/Program Files/Git/bin/bash.exe")
  (setq w32-quote-process-args ?\")
  (setq null-device "/dev/null")

  ;;
  ;; After saving file,
  ;; revert-buffer-with-coding-system windows-1250
  ;; To handle smart quotes
  ;; Not sure how to force that
  ;;
  )

(provide 'setup-microsoft-windows)
