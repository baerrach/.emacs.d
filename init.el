;;; Enable for debugging problems
;(setq debug-on-quit t)
(setq debug-on-error t)

;;;
;;; Desktop save mode
;;; http://ergoemacs.org/emacs/emacs_save_restore_opened_files.html
;;;
;; save/restore opened files and windows config
(desktop-save-mode 1) ; 0 for off

;;;
;;; https://github.com/magnars/.emacs.d/blob/master/init.el
;;;

;; Turn off mouse interface early in startup to avoid momentary display
(if (fboundp 'menu-bar-mode) (menu-bar-mode -1))
(if (fboundp 'tool-bar-mode) (tool-bar-mode -1))
(if (fboundp 'scroll-bar-mode) (scroll-bar-mode -1))

;; No splash screen please ... jeez
(setq inhibit-startup-message t)

;; Set path to dependencies
(setq site-lisp-dir
      (expand-file-name "site-lisp" user-emacs-directory))

(setq settings-dir
      (expand-file-name "settings" user-emacs-directory))

;; Set up load path
(add-to-list 'load-path settings-dir)
(add-to-list 'load-path site-lisp-dir)

;; Keep emacs Custom-settings in separate file
(setq custom-file (expand-file-name "custom.el" user-emacs-directory))
(load custom-file)

;; Set up appearance early
(require 'appearance)

;; Write backup files to own directory
(setq backup-directory-alist
      `(("." . ,(expand-file-name
                 (concat user-emacs-directory "backups")))))

;; Make backups of files, even when they're in version control
(setq vc-make-backup-files t)

;; Save point position between sessions
(require 'saveplace)
(setq-default save-place t)

;; What system are we on?
(setq is-mac (equal system-type 'darwin))
(setq is-win (equal system-type 'windows-nt))

;; Functions (load all files in defuns-dir)
(setq defuns-dir (expand-file-name "defuns" user-emacs-directory))
(dolist (file (directory-files defuns-dir t "\\w+"))
  (when (file-regular-p file)
    (load file)))

;; Setup packages
(require 'setup-package)

;; Install extensions if they're missing
(defun init--install-packages ()
  (packages-install
   '(ace-jump-buffer
     css-eldoc
     dired-details
     dockerfile-mode
     elisp-slime-nav
     f
     find-file-in-project
     flx
     flx-ido
     flycheck
     guide-key
     highlight-escape-sequences
     ido-at-point
     ido-ubiquitous
     ido-vertical-mode
     js2-mode
     js2-refactor
     magit
     markdown-mode
     multiple-cursors
     nodejs-repl
     paredit
     perspective
     prodigy
     restclient
     simplezen
     slime
     smartparens
     smart-forward
     smex
     string-edit
     tagedit
     visual-regexp
     whitespace-cleanup-mode
     yasnippet
     )))

(condition-case nil
    (init--install-packages)
  (error
   (package-refresh-contents)
   (init--install-packages)))

;; Lets start with a smattering of sanity
(require 'sane-defaults)

;; Setup environment variables from the user's shell.
(when is-mac
  (require-package 'exec-path-from-shell)
  (exec-path-from-shell-initialize)
  (require 'mac))

(when is-win
  (require 'microsoft-windows))

;; guide-key
(require 'guide-key)
(setq guide-key/guide-key-sequence '("C-x r" "C-x 4" "C-x v" "C-x 8" "C-x +"))
(guide-key-mode 1)
(setq guide-key/recursive-key-sequence-flag t)
(setq guide-key/popup-window-position 'bottom)

;; Default setup of smartparens
(require 'smartparens-config)
(setq sp-autoescape-string-quote nil)
(--each '(css-mode-hook
          restclient-mode-hook
          js-mode-hook
          java-mode
          ruby-mode
          markdown-mode
          groovy-mode
          scala-mode)
  (add-hook it 'turn-on-smartparens-mode))


;; Load stuff on demand
(autoload 'auto-complete-mode "auto-complete" nil t)

;; Highlight escape sequences
(require 'highlight-escape-sequences)
(hes-mode)
(put 'font-lock-regexp-grouping-backslash 'face-alias 'font-lock-builtin-face)

;; Visual regexp
(require 'visual-regexp)

(require 'ace-jump-mode)
(require 'expand-region)
(require 'multiple-cursors)
(require 'smart-forward)

;; Smart M-x is smart
(require 'smex)
(smex-initialize)

(require 're-builder)
(setq reb-re-syntax 'string)

;; Setup extensions
(eval-after-load 'dired '(require 'setup-dired))
(eval-after-load 'find-file-in-project '(require 'setup-find-file-in-project))
(eval-after-load 'flycheck '(require 'setup-flycheck))
(eval-after-load 'grep '(require 'setup-grep))
(eval-after-load 'hippie-expand '(require 'setup-hippie-expand))
(eval-after-load 'ido '(require 'setup-ido))
(eval-after-load 'magit '(require 'setup-magit))
(eval-after-load 'paredit '(require 'setup-paredit))
(eval-after-load 'sgml-mode '(require 'setup-html-mode))
(eval-after-load 'shell '(require 'setup-shell))
;; Language specific setup files
(eval-after-load 'js2-mode '(require 'setup-js2-mode))
(eval-after-load 'markdown-mode '(require 'setup-markdown-mode))
(eval-after-load 'ruby-mode '(require 'setup-ruby-mode))

;; Map files to modes
(require 'mode-mappings)

;; Setup key bindings
(require 'key-bindings)
