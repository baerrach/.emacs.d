(require 'use-package)

(use-package magit
  :ensure
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

  (defun disable-debug-on-error--around-with-editor-finish (orig-fun &rest args)
    "Disable debug-on-error around with-editor-finish.

Saving files soft handles errors and promotes them to warnings.
But with debug-on-error enabled it causes the debugger to open
instead of ignoring what should be a warning."
    (let (debug-on-error nil)
      (apply orig-fun args)))
  (advice-add 'with-editor :around #'disable-debug-on-error--around-with-editor-finish))

(provide 'setup-magit)
