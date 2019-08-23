(require 'use-package)

(defun dired-revert-buffer--reload-after-changes (ignored)
  "Reload dired after any changes are made"
  (revert-buffer))

(defun dired-back-to-start-of-files ()
  (interactive)
  (backward-char (- (current-column) 2)))

(defun dired-back-to-top ()
  (interactive)
  (beginning-of-buffer)
  (dired-next-line 4))

(defun dired-jump-to-bottom ()
  (interactive)
  (end-of-buffer)
  (dired-next-line -1))

(use-package dired
  :requires (dired-narrow dash wdired)
  :bind (:map dired-mode-map
              ("C-a" . dired-back-to-start-of-files) ;; C-a is nicer in dired if it moves back to start of files
              ("k" . dired-do-delete)
              ("/" . dired-narrow)
              ;; M-up is nicer in dired if it moves to the fourth line - the first file
              ([remap beginning-of-buffer] . dired-back-to-top)
              ([remap smart-up] . dired-back-to-top)
              ;; M-down is nicer in dired if it moves to the last file
              ([remap end-of-buffer] . dired-jump-to-bottom)
              ([remap smart-down] . dired-jump-to-bottom)
              ;; Delete with C-x C-k to match file buffers and magit
              ("C-x C-k" .  dired-do-delete)
              :map wdired-mode-map
              ("C-a" . dired-back-to-start-of-files)
              ([remap beginning-of-buffer] . dired-back-to-top)
              ([remap end-of-buffer] . dired-jump-to-bottom))
  :custom
  (dired-details-hidden-string "" "Make dired less verbose when in hide details mode")
  (dired-dwim-target t "Move files between split panes")
  :config
  ;; Reload dired after making changes
  (--each '(dired-do-rename
            dired-do-copy
            dired-create-directory
            wdired-abort-changes)
    (advice-add it :after #'dired-revert-buffer--reload-after-changes)))

(provide 'setup-dired)
