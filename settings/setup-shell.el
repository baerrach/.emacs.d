(require 'use-package)

;; Setup shell

;; Note: Emacs runs .bashrc in *shell*
;; So mac users should ln -s .profile .bashrc

(use-package shell-command
  :commands shell
  :ensure nil)

(provide 'setup-shell)
