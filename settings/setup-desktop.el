(require 'use-package)

;;;
;;; Desktop save mode
;;; http://ergoemacs.org/emacs/emacs_save_restore_opened_files.html
;;;
(use-package desktop
  :ensure nil
  :custom
  (desktop-save-mode t "save/restore opened files and windows config"))

(provide 'setup-desktop)
