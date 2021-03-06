(require 'use-package)

(straight-use-package '(files :type built-in))

(use-package files
  :config
  (defun disable-debug-on-error--backup-buffer-copy (orig-fun &rest args)
    "Disable debug-on-error around backup-buffer-copy.

See https://bug-gnu-emacs.gnu.narkive.com/pRQgqRm6/bug-29455-backup-by-copying-acl-operation-not-permitted-with-windows-7-and-samba

Saving files soft handles errors and promotes them to warnings.
But with debug-on-error enabled it causes the debugger to open
instead of ignoring what should be a warning."
    (let ((debug-on-error nil))
      (apply orig-fun args)))
  (advice-add 'backup-buffer-copy :around #'disable-debug-on-error--backup-buffer-copy))

(provide 'setup-files)
