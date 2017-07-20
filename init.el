;;; Enable for debugging problems
;; (setq debug-on-quit t)
;; (setq debug-on-error t)

;; Added by Package.el.  This must come before configurations of
;; installed packages.  Don't delete this line.  If you don't want it,
;; just comment it out by adding a semicolon to the start of the line.
;; You may delete these explanatory comments.
(package-initialize)

(add-hook 'debugger-mode-hook 'turn-on-visual-line-mode)

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
     ace-jump-mode
     auto-complete
     buttercup
     css-eldoc
     dash
     dired-details
     dockerfile-mode
     f
     find-file-in-project
     flx
     flx-ido
     flycheck
     flycheck-pos-tip
     guide-key
     highlight-escape-sequences
     ido-at-point
     ido-ubiquitous
     ido-vertical-mode
     json-mode
     js2-mode
     js2-refactor
     magit
     markdown-mode
     multiple-cursors
     nodejs-repl
     org-bullets
     perspective
     perl6-mode
     prodigy
     restclient
     simplezen
     skewer-mode
     smartparens
     smart-forward
     smex
     string-edit
     tagedit
     visual-regexp
     web-mode
     whitespace-cleanup-mode
     yasnippet
     yaml-mode
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
;; (require 'guide-key)
;; (setq guide-key/guide-key-sequence '("C-x r" "C-x 4" "C-x v" "C-x 8" "C-x +"))
;; (guide-key-mode 1)
;; (setq guide-key/recursive-key-sequence-flag t)
;; (setq guide-key/popup-window-position 'bottom)

;; Default setup of smartparens
(require 'smartparens-config)
(setq sp-autoescape-string-quote nil)
(--each '(restclient-mode-hook
          js-mode-hook
          java-mode
          ruby-mode
          markdown-mode
          groovy-mode
          scala-mode)
  (add-hook it 'turn-on-smartparens-mode))


;; Load stuff on demand
(autoload 'auto-complete-mode "auto-complete" nil t)
(require 'auto-complete-config)
(ac-config-default)

;; Highlight escape sequences
(require 'highlight-escape-sequences)
(hes-mode)
(put 'font-lock-regexp-grouping-backslash 'face-alias 'font-lock-builtin-face)

(require 're-builder)
(setq reb-re-syntax 'string)

;; Setup extensions
(require 'ace-jump-mode)
(eval-after-load 'dired '(require 'setup-dired))
(eval-after-load 'find-file-in-project '(require 'setup-find-file-in-project))
(require 'expand-region)
(eval-after-load 'flycheck '(require 'setup-flycheck))
(eval-after-load 'grep '(require 'setup-grep))
(require 'setup-hippie-expand)
(eval-after-load 'ido '(require 'setup-ido))
(eval-after-load 'magit '(require 'setup-magit))
(require 'multiple-cursors)
(eval-after-load 'org '(require 'setup-org-mode))
(eval-after-load 'sgml-mode '(require 'setup-html-mode))
(eval-after-load 'shell '(require 'setup-shell))
(skewer-setup)
(require 'smart-forward)
(require 'smex)
(smex-initialize)
(require 'smooth-scrolling)
(require 'visual-regexp)
(eval-after-load 'yaml-mode '(require 'setup-yaml-mode))
(require 'setup-yasnippet)

;; Language specific setup files
(eval-after-load 'js2-mode '(require 'setup-js2-mode))
(eval-after-load 'markdown-mode '(require 'setup-markdown-mode))
(eval-after-load 'ruby-mode '(require 'setup-ruby-mode))
(eval-after-load 'web-mode '(require 'setup-web-mode))

;; Map files to modes
(require 'mode-mappings)

;; Setup key bindings
(require 'key-bindings)

;; Disable bell on scrolling past limit
(defun my-bell-function ()
  (unless (memq this-command
        '(isearch-abort abort-recursive-edit exit-minibuffer
              keyboard-quit mwheel-scroll down up next-line previous-line
              backward-char forward-char))
    (ding)))
(setq ring-bell-function 'my-bell-function)
(put 'downcase-region 'disabled nil)
