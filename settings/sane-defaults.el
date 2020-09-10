;; Allow pasting selection outside of Emacs
(setq x-select-enable-clipboard t)

;; Show keystrokes in progress
(setq echo-keystrokes 0.1)

;; Move files to trash when deleting
(setq delete-by-moving-to-trash t)

;; Real emacs knights don't use shift to mark things
(setq shift-select-mode nil)

;; Transparently open compressed files
(auto-compression-mode t)

;; Enable syntax highlighting for older Emacsen that have it off
(global-font-lock-mode t)

;; Answering just 'y' or 'n' will do
(defalias 'yes-or-no-p 'y-or-n-p)

;; UTF-16-le on Windows for Chinese character support M-x view-hello-file to see if it works
(set-language-environment "UTF-8")
(set-selection-coding-system 'utf-16-le)

;; Show active region
(transient-mark-mode 1)
(make-variable-buffer-local 'transient-mark-mode)
(put 'transient-mark-mode 'permanent-local t)
(setq-default transient-mark-mode t)

;; Remove text in active region if inserting text
(delete-selection-mode 1)

;; Always display line and column numbers
(setq line-number-mode t)
(setq column-number-mode t)

;; Lines should be 80 characters wide, not 72
(setq-default fill-column 80)

;; Don't ring the bell
(setq ring-bell-function 'ignore)

;; Never insert tabs
(setq-default indent-tabs-mode nil)

;; Show me empty lines after buffer end
(set-default 'indicate-empty-lines t)

;; Don't break lines for me, please
(setq-default truncate-lines t)

;; Allow recursive minibuffers
(setq enable-recursive-minibuffers t)

;; org-mode: Don't ruin S-arrow to switch windows please (use M-+ and M-- instead to toggle)
(setq org-replace-disputed-keys t)

;; Fontify org-mode code blocks
(setq org-src-fontify-natively t)

;; Sentences do not need double spaces to end. Period.
(set-default 'sentence-end-double-space nil)

;; A saner ediff
(setq ediff-diff-options "-w")
(setq ediff-split-window-function 'split-window-horizontally)
(setq ediff-window-setup-function 'ediff-setup-windows-plain)

;; No electric indent
(setq electric-indent-mode nil)

;; Nic says eval-expression-print-level needs to be set to nil (turned off) so
;; that you can always see what's happening.
(setq eval-expression-print-level nil)

;; Offer to create parent directories if they do not exist
;; http://iqbalansari.github.io/blog/2014/12/07/automatically-create-parent-directories-on-visiting-a-new-file-in-emacs/
(defun my-create-non-existent-directory ()
  (let ((parent-directory (file-name-directory buffer-file-name)))
    (when (and (not (file-exists-p parent-directory))
               (y-or-n-p (format "Directory `%s' does not exist! Create it?" parent-directory)))
      (make-directory parent-directory t))))

(add-to-list 'find-file-not-found-functions 'my-create-non-existent-directory)

(global-unset-key (kbd "C-z"))

;;; Backup settings

;; deleting old backups
(defun bae-delete-old-backups ()
  (let* ((backup-directory (expand-file-name
                            (concat user-emacs-directory "backups")))
         (auto-save-directory (concat backup-directory "/\\1")))
    (setq backup-by-copying t)      ; don't clobber symlinks
    ;; Write backup files to own directory
    (setq backup-directory-alist `(("." . ,backup-directory)))
    ;; auto-save files to same backup-directory
    (setq auto-save-file-name-transforms `((".*" ,auto-save-directory t)))
    ;; Make backups of files, even when they're in version control
    (setq vc-make-backup-files t)
    (setq delete-old-versions t)
    (message "Deleting old backup files...")
    (let ((week (* 60 60 24 7))
          (current (float-time (current-time))))
      (dolist (file (directory-files backup-directory t)) ;
        (when (and (backup-file-name-p file)
                   (> (- current (float-time (fifth (file-attributes file))))
                      week))
          (message "%s" file)
          (delete-file file))))
    (message "Deleting old backup files...done")
    (message nil)))
(add-hook 'window-setup-hook #'bae-delete-old-backups)

;; Disable lock files .# as this is for single-user configuration
(setq create-lockfiles nil)

;;;
;;; http://www.emacswiki.org/emacs/SmoothScrolling
;;;

;; scroll one line at a time (less "jumpy" than defaults)
(setq mouse-wheel-scroll-amount '(1 ((shift) . 1))) ;; one line at a time
(setq mouse-wheel-progressive-speed 't) ;; don't accelerate scrolling
(setq mouse-wheel-follow-mouse 't) ;; scroll window under mouse
(setq scroll-step 1) ;; keyboard scroll one line at a time

(provide 'sane-defaults)

;;
