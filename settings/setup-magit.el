(require 'use-package)

(use-package magit
  :ensure t
  :hook ((magit-revision-mode . visual-line-mode)
         (magit-mode . hl-line-mode))
  :bind (("C-x g" . magit-status))
  :custom
  (magit-section-initial-visibility-alist
   '((untracked . show)
     (unstaged . show)
     (unpushed . show)
     (unpulled . show)
     (stashes . show)))
  (magit-diff-refine-hunk t "how fine differences for the current diff hunk only"))

(provide 'setup-magit)
