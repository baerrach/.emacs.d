;;; Enable for debugging problems
; (setq debug-on-quit t)
; (setq debug-on-error t)

(setq use-package-verbose t)
(setq use-package-expand-minimally nil)
(setq use-package-compute-statistics t)
(setq debug-on-error t)

;;; Bare-Bones Emacs Setup::Start

;; Turn off mouse interface early in startup to avoid momentary display
(if (fboundp 'menu-bar-mode) (menu-bar-mode -1))
(if (fboundp 'tool-bar-mode) (tool-bar-mode -1))
(if (fboundp 'scroll-bar-mode) (scroll-bar-mode -1))

;; No splash screen please
(setq inhibit-startup-message t)

;; Added by Package.el.  This must come before configurations of
;; installed packages.  Don't delete this line.  If you don't want it,
;; just comment it out by adding a semicolon to the start of the line.
;; You may delete these explanatory comments.
(package-initialize)

(defun setup-load-path ()
  "Configure load-path for local user-emacs-directory support"
  (setq site-lisp-dir
        (expand-file-name "site-lisp" user-emacs-directory))
  (setq settings-dir
        (expand-file-name "settings" user-emacs-directory))
  (add-to-list 'load-path settings-dir)
  (add-to-list 'load-path site-lisp-dir))
(setup-load-path)

;; Initialize package handling
(require 'setup-package)
(require 'setup-use-package)
(require 'setup-delight) ; needed for use-package :delight
(require 'setup-diminish) ; needed for use-package :diminish
(require 'setup-bind-key) ; needed for use-package :bind

;;; Bare-Bones Emacs Setup::End

;;; User Specific Settings
;; From this point onwards you want to pick and choose which pieces make sense
;; to your Emacs workflow and only include those.

;;; Setup order dependent packages
(require 'setup-custom)
(require 'setup-emacs-appearance)
(require 'setup-emacs-theme)

;;; Libraries

;;; Setup order independent packages
(require 'setup-emacs-server)
(require 'setup-debugger)
(require 'setup-desktop)
(require 'setup-saveplace)

;; What system are we on?
(setq is-mac (equal system-type 'darwin))
(setq is-win (equal system-type 'windows-nt))

;; TODO: Refactor to setup-* and using use-package
;;    '(ace-jump-buffer ;; replacing with avy
;;      ace-jump-mode ;; replacing with avy
;;      auto-complete
;;      find-file-in-project
;;      flx
;;      flx-ido
;;      guide-key
;;      ido-at-point
;;      ido-completing-read+
;;      ido-vertical-mode
;;      nodejs-repl
;;      projectile
;;      )))

;; (condition-case nil
;;     (init--install-packages)
;;   (error
;;    (package-refresh-contents)
;;    (init--install-packages)))

;; Lets start with a smattering of sanity
(require 'sane-defaults)

;; Setup environment variables from the user's shell.
(when is-mac
  (require-package 'exec-path-from-shell)
  (exec-path-from-shell-initialize)
  (require 'mac))

(when is-win
  (require 'microsoft-windows))

(require 'setup-defuns)

;; TODO Add guide-key
;; guide-key
;; (require 'guide-key)
;; (setq guide-key/guide-key-sequence '("C-x r" "C-x 4" "C-x v" "C-x 8" "C-x +"))
;; (guide-key-mode 1)
;; (setq guide-key/recursive-key-sequence-flag t)
;; (setq guide-key/popup-window-position 'bottom)
(require 'setup-add-node-modules-path)
(require 'setup-apache-mode)
(require 'setup-auto-package-update)
(require 'setup-avy)
(require 'setup-browse-kill-ring)
(require 'setup-company)
(require 'setup-company-lsp)
(require 'setup-css-eldoc)
(require 'setup-dash)
(require 'setup-dired)
(require 'setup-dired-narrow)
(require 'setup-disabled-commands)
(require 'setup-expand-region)
(require 'setup-flycheck)
(require 'setup-flycheck-pos-tip)
(require 'setup-grep)
(require 'setup-guide-key)
(require 'setup-highlight-escape-sequences)
(require 'setup-hunspell)
(require 'setup-hydra)
;(require 'setup-ido)
(require 'setup-image-mode)
(require 'setup-indium)
(require 'setup-ivy)
(require 'setup-js2-mode)
(require 'setup-json-mode)
(require 'setup-lsp-mode)
(require 'setup-magit)
(require 'setup-markdown-mode)
(require 'setup-move-text)
(require 'setup-multiple-cursors)
(require 'setup-org-mode)
(require 'setup-personal)
(require 'setup-prettier-js)
(require 'setup-projectile)
(require 'setup-rainbow-mode)
(require 'setup-re-builder)
(require 'setup-rjsx-mode)
(require 'setup-ruby-mode)
(require 'setup-shell)
(require 'setup-simplezen)
(require 'setup-smart-forward)
(require 'setup-smartparens)
(require 'setup-smex)
(require 'setup-smooth-scrolling)
(require 'setup-string-inflection)
(require 'setup-tide)
(require 'setup-undo-tree)
(require 'setup-unicode-fonts)
(require 'setup-uniquify)
(require 'setup-visual-basic-mode)
(require 'setup-visual-regexp)
(require 'setup-wdired)
(require 'setup-web-mode)
(require 'setup-wgrep)
(require 'setup-ws-butler)
(require 'setup-yaml-mode)
(require 'setup-yasnippet)

(require 'key-bindings)

;; TODO - UP TO HERE

;; See setup-debugger - check all hooks are using syntax from
;; https://github.com/nickmccurdy/add-hooks/blob/master/add-hooks.el
;;

;; Run eslisp lint over files
