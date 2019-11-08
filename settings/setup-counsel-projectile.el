(require 'use-package)

(use-package counsel-projectile
  :after (counsel projectile el-patch)
  :custom
  (counsel-projectile-find-file-action '(1
                                         ("o" counsel-projectile-find-file-action
                                          "current window")
                                         ("j" counsel-projectile-find-file-action-other-window
                                          "other window")
                                         ("x" counsel-projectile-find-file-action-extern
                                          "open externally")
                                         ("R" bae/counsel-projectile-find-file-action-move
                                          "rename or move")
                                         ("m" counsel-projectile-find-file-action-find-file-manually
                                          "find file manually")
                                         ("k" counsel-projectile-find-file-action-delete
                                          "delete")
                                         ("p" counsel-projectile-find-file-action-switch-project
                                          "switch project")))
  :config
  (el-patch-feature counsel-projectile)
  (with-eval-after-load 'counsel-projectile
    (el-patch-defun counsel-find-file-move (x)
      "Move or rename file X."
      (require 'dired-aux)
      (counsel--find-file-1 "Rename file to: "
                            (el-patch-swap ivy--directory x)
                            (lambda (new-name)
                              (el-patch-add
                                (let ((dir (file-name-directory new-name)))
                                  (if (not (file-directory-p dir))
                                    (make-directory dir t))))
                              (dired-rename-file x new-name 1))
                            'counsel-find-file-move)))

  (defun bae/counsel-projectile-find-file-action-move (file)
    "Move or rename file FILE."
    (counsel-find-file-move (projectile-expand-root file)))

  (counsel-projectile-mode 1))

(provide 'setup-counsel-projectile)
