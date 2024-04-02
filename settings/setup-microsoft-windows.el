(when (equal system-type 'windows-nt)
  ;; When running in Windows, we use Git Bash as alternate shell
  ;; See M-x describe-function shell for full details on these variables
  ;;
  ;; Don't use explicit-shell-file-name as that will be a fully qualified path
  ;; that some commands will dislike the spaces in the directories.
  ;;
  ;; Ensure that your %PATH% is setup to include C:/Program Files/Git/bin/
;  (setq shell-file-name "bash")
;  (setq explicit-bash.exe-args '("--noediting" "--login" "-i"))
  ;; Tramp is used by magit
;  (setq tramp-encoding-shell "bash")
;  (setq w32-quote-process-args ?\")
;  (setq null-device "/dev/null")

  ;;
  ;; After saving file,
  ;; revert-buffer-with-coding-system windows-1250
  ;; To handle smart quotes
  ;; Not sure how to force that
  ;;
  )

(provide 'setup-microsoft-windows)
