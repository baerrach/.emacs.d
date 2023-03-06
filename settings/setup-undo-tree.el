(require 'use-package)

(use-package undo-tree
  ;; Represent undo-history as an actual tree (visualize with C-x u)
  :diminish
  :bind (("C-z" . undo-tree-undo)
         ("C-S-z" . undo-tree-redo)
         :map undo-tree-map
         ("C-/" . nil))
  :custom
  (undo-tree-history-directory-alist '(("." . "~/.emacs.d/undo")))
  :config
  (defun bae/undo-tree-overridden-undo-bindings-p (r)
    "turn-on-undo-tree-mode doesn't have an easy hook for adding new
checks. In this case the minor mode git-commit-mode should
disable undo-tree-mode but only major modes are checked. Using
this function as an advice gives a hook to check the minor mode
as well."
    (or (bound-and-true-p git-commit-mode)
        r)
    )
  (advice-add 'undo-tree-overridden-undo-bindings-p :filter-return #'bae/undo-tree-overridden-undo-bindings-p)
  (global-undo-tree-mode))

(provide 'setup-undo-tree)
