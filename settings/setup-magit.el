(require 'use-package)

(use-package magit
  :after (ivy)
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
      (magit-section-forward-sibling))))

(provide 'setup-magit)
