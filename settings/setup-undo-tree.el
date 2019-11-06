(require 'use-package)

(use-package undo-tree
  ;; Represent undo-history as an actual tree (visualize with C-x u)
  :diminish
  :bind (("C-z" . undo-tree-undo)
         ("C-S-z" . undo-tree-redo)
         :map undo-tree-map
         ("C-/" . nil))
  :config
  (global-undo-tree-mode))

(provide 'setup-undo-tree)
