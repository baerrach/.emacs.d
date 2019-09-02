(require 'use-package)

(use-package magit
  :ensure
  :after ivy
  :hook ((magit-revision-mode . visual-line-mode)
         (magit-mode . hl-line-mode)
         (magit-post-refresh . bae-magit-move-to-next-section-if-at-head))
  :bind (("C-x g" . magit-status))
  :custom
  (magit-section-initial-visibility-alist
   '((untracked . show)
     (unstaged . show)
     (unpushed . show)
     (unpulled . show)
     (stashes . show)))
  (magit-diff-refine-hunk t "how fine differences for the current diff hunk only")
  :config
  (defun bae-magit-move-to-next-section-if-at-head ()
    (interactive)
    (when (looking-at "Head")
      (magit-section-forward-sibling)))

  (defun disable-debug-on-error--backup-buffer-copy (orig-fun &rest args)
    "Disable debug-on-error around backup-buffer-copy.

See https://bug-gnu-emacs.gnu.narkive.com/pRQgqRm6/bug-29455-backup-by-copying-acl-operation-not-permitted-with-windows-7-and-samba

Saving files soft handles errors and promotes them to warnings.
But with debug-on-error enabled it causes the debugger to open
instead of ignoring what should be a warning."
    (let ((debug-on-error nil))
      (apply orig-fun args)))
  (advice-add 'backup-buffer-copy :around #'disable-debug-on-error--backup-buffer-copy))

(provide 'setup-magit)
