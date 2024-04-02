(require 'use-package)

;; Tramp
(use-package tramp
  :ensure nil
  :init
  ; Create https://emacs.stackexchange.com/questions/74636/how-to-execute-sudo-su-login-username-command-with-tramp
  ; New "sudosu" that does sudo su - %u
  (add-to-list 'tramp-methods
	`("sudosu"
	  (tramp-login-program      "sudo")
	  (tramp-login-args         (("su") ("-") ("%u")))
;          (tramp-remote-shell #1#)
;	  (tramp-remote-shell-login ("-l"))
;	  (tramp-remote-shell-args  ("-c"))
          (tramp-password-previous-hop t))
        )

  (add-to-list 'tramp-connection-properties
             (list (regexp-quote "/ssh:")
                   "login-args" '("-tt")))
)

;(when (eq system-type 'windows-nt)
;  ;; Get the tramp-methods variable populated
;  (require 'tramp)
;  ;; Add the '-tt' flag to the login arguments for "ssh" ONLY
;  (push '("-tt")
;        (cadr (assoc 'tramp-login-args
;                     (assoc "ssh" tramp-methods)))))

(provide 'setup-tramp)

;; Dont use plink if we can avoid it
; /plink:treloarb@dptitrbavd01:~/

;; Don't use sshx as it uses RemoteCommand which the other end doesn't support
; /sshx:treloarb@dptitrbavd01:~/
; /sshx:treloarb@dptitrbavd01|sudosu:prodsupport@dptitrbavd01:~

;; ssh need the -tt option passed in on Windows to allocate a tty
; /ssh:treloarb@dptitrbavd01|ssh:treloarb@dtuptrolvd03:~

;; Enable/Disable debug on errors
; (setq debug-on-error t)
; (setq debug-on-error nil)

;; Sent and Received strings
; (setq tramp-verbose 6)

;; test commands
; (setq tramp-verbose 9)

;; traces (huge)
; (setq tramp-descverbose 10)

; (tramp-file-name-handler(expand-file-name "/ssh:treloarb@dptitrbavd01:~/" "~/.emacs.d/settings/"))
