;;; Enable for debugging problems
; (setq debug-on-quit t)
; (setq debug-on-error t)

;;; Use straight.el

(defvar bootstrap-version)
(let ((bootstrap-file
       (expand-file-name "straight/repos/straight.el/bootstrap.el" user-emacs-directory))
      (bootstrap-version 5))
  (unless (file-exists-p bootstrap-file)
    (with-current-buffer
        (url-retrieve-synchronously
         "https://raw.githubusercontent.com/raxod502/straight.el/develop/install.el"
         'silent 'inhibit-cookies)
      (goto-char (point-max))
      (eval-print-last-sexp)))
  (load bootstrap-file nil 'nomessage))

;; https://github.com/raxod502/straight.el/blob/develop/README.md#integration-with-use-package
(setq straight-use-package-by-default t)
(straight-use-package 'use-package)

(setq use-package-verbose t)
(setq use-package-expand-minimally nil)
(setq use-package-compute-statistics t)

;;; Bare-Bones Emacs Setup::Start

;; Turn off mouse interface early in startup to avoid momentary display
(if (fboundp 'menu-bar-mode) (menu-bar-mode -1))
(if (fboundp 'tool-bar-mode) (tool-bar-mode -1))
(if (fboundp 'scroll-bar-mode) (scroll-bar-mode -1))

;; No splash screen please
(setq inhibit-startup-message t)

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

;;; Operating Specific setups
(require 'setup-mac)
(require 'setup-microsoft-windows)

;;; Lets start with a smattering of sanity
(require 'sane-defaults)

;;; Setup Packages
(require 'setup-add-node-modules-path)
(require 'setup-ag)
(require 'setup-amx)
(require 'setup-apache-mode)
(require 'setup-autorevert)
(require 'setup-avy)
(require 'setup-browse-kill-ring)
(require 'setup-company)
(require 'setup-company-lsp)
(require 'setup-counsel)
(require 'setup-counsel-projectile)
(require 'setup-css-eldoc)
(require 'setup-dash)
(require 'setup-debugger)
(require 'setup-defuns)
(require 'setup-desktop)
(require 'setup-dired)
(require 'setup-dired-narrow)
(require 'setup-disabled-commands)
(require 'setup-edit-server)
(require 'setup-el-patch)
(require 'setup-emacs-server)
(require 'setup-expand-region)
(require 'setup-explain-pause-mode)
(require 'setup-files)
(require 'setup-flycheck)
(require 'setup-flycheck-pos-tip)
(require 'setup-fullframe)
(require 'setup-grep)
(require 'setup-guide-key)
(require 'setup-highlight-escape-sequences)
(require 'setup-hippie-exp)
(require 'setup-hunspell)
(require 'setup-hydra)
(require 'setup-image-mode)
(require 'setup-indium)
(require 'setup-ivy)
(require 'setup-js2-mode)
(require 'setup-json-mode)
(require 'setup-lsp-mode)
(require 'setup-lsp-python-ms)
(require 'setup-macros)
(require 'setup-magit)
(require 'setup-markdown-mode)
(require 'setup-minibuffer)
(require 'setup-move-text)
(require 'setup-multiple-cursors)
(require 'setup-nginx-mode)
(require 'setup-olivetti)
(require 'setup-org-mode)
(require 'setup-personal)
(require 'setup-php-mode)
(require 'setup-prettier-js)
(require 'setup-projectile)
(require 'setup-rainbow-mode)
(require 'setup-re-builder)
(require 'setup-recentf)
(require 'setup-rjsx-mode)
(require 'setup-ruby-mode)
(require 'setup-savehist)
(require 'setup-saveplace)
(require 'setup-shell)
(require 'setup-simplezen)
(require 'setup-smart-forward)
(require 'setup-smartparens)
(require 'setup-smooth-scrolling)
(require 'setup-so-long)
(require 'setup-string-inflection)
(require 'setup-swiper)
(require 'setup-systemd-mode)
(require 'setup-tide)
(require 'setup-undo-tree)
(require 'setup-unicode-fonts)
(require 'setup-uniquify)
(require 'setup-visual-regexp)
(require 'setup-vlf)
(require 'setup-wdired)
(require 'setup-web-mode)
(require 'setup-wgrep)
(require 'setup-wgrep-ag)
(require 'setup-winner)
(require 'setup-ws-butler)
(require 'setup-yaml-mode)
(require 'setup-yasnippet)

;; Setup Packages - End

(require 'key-bindings)

;; See setup-debugger - check all hooks are using syntax from
;; https://github.com/nickmccurdy/add-hooks/blob/master/add-hooks.el
;;

;; Run eslisp lint over files

; Always use bae/work-settings as default
(bae/work-settings)
