;;; Enable for debugging problems
; (setq debug-on-quit t)
; (setq debug-on-error t)

(setq use-package-verbose t
      use-package-expand-minimally nil
      use-package-compute-statistics t
      debug-on-error t)

;; Turn off mouse interface early in startup to avoid momentary display
(if (fboundp 'menu-bar-mode) (menu-bar-mode -1))
(if (fboundp 'tool-bar-mode) (tool-bar-mode -1))
(if (fboundp 'scroll-bar-mode) (scroll-bar-mode -1))

;; No splash screen please ... jeez
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

;;; Initialize package handling
(require 'setup-package)
(require 'setup-use-package)
(require 'setup-delight) ; needed for use-pacakge :delight
(require 'setup-diminish) ; needed for use-package :diminish
(require 'setup-bind-key) ; needed for use-package :bind

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
;; Install extensions if they're missing
;; (defun init--install-packages ()
;;   (packages-install
;;    '(ace-jump-buffer ;; replacing with avy
;;      ace-jump-mode ;; replacing with avy
;;      add-node-modules-path
;;      auto-complete
;;      buttercup
;;      company
;;      company-lsp
;;      css-eldoc
;;      dash
;;      dired-narrow
;;      dockerfile-mode
;;      f
;;      find-file-in-project
;;      flx
;;      flx-ido
;;      flycheck
;;      flycheck-pos-tip
;;      graphql-mode
;;      guide-key
;;      highlight-escape-sequences
;;      ido-at-point
;;      ido-completing-read+
;;      ido-vertical-mode
;;      indium
;;      json-mode
;;      js2-mode
;;      js2-refactor
;;      lsp-mode
;;      lsp-ui ; TODO: consider flycheck
;;      magit
;;      markdown-mode
;;      multiple-cursors
;;      nodejs-repl
;;      org-bullets
;;      perspective
;;      perl6-mode
;;      powershell
;;      prettier-js
;;      prodigy
;;      projectile
;;      rainbow-mode
;;      restclient
;;      rjsx-mode
;;      s
;;      simplezen
;;      smartparens
;;      smart-forward
;;      smex
;;      string-edit
;;      string-inflection
;;      tagedit
;;      tide
;;      unicode-fonts
;;      visual-regexp
;;      web-mode
;;      wgrep
;;      whitespace-cleanup-mode
;;      ws-butler
;;      yasnippet
;;      yaml-mode
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

;; TODO
;; Describe how to use use-package, i.e file in settings/setup-<package-name>.el, provide 'setup-<package-name>
;; Bundled packages must always have :ensure nil
;; Always use :after not :require
;; Always ensure any packages declared in :after also have use-package definitions
;; Order independent
;; Hooks: don't append '-hook' it wont work
;; Hooks: don't prepend functions with #' as it wont work, hooks expect symbols
;; Use commands: <mode-name>/command to defer loading until that command is invoked

;; TODO Add guide-key
;; guide-key
;; (require 'guide-key)
;; (setq guide-key/guide-key-sequence '("C-x r" "C-x 4" "C-x v" "C-x 8" "C-x +"))
;; (guide-key-mode 1)
;; (setq guide-key/recursive-key-sequence-flag t)
;; (setq guide-key/popup-window-position 'bottom)

(require 'setup-smartparens)
(require 'setup-highlight-escape-sequences)
(require 'setup-re-builder)

;; Setup extensions - DO NOT USE :require, use :after instead.
(require 'setup-avy)
(require 'setup-company)
(require 'setup-dired-narrow)
(require 'setup-dash)
(require 'setup-wdired)
(require 'setup-dired)
(require 'setup-expand-region)
(require 'setup-flycheck-pos-tip)
(require 'setup-flycheck)
(require 'setup-move-text)
(require 'setup-grep)
;(require 'setup-hippie-expand) ; TODO DELETE and setup file
(require 'setup-hunspell)
(require 'setup-ido)
(require 'setup-indium)
(require 'setup-magit)
(require 'setup-multiple-cursors)
;; TODO - UP TO HERE
(require 'setup-lsp-mode)
(eval-after-load 'org '(require 'setup-org-mode))
(require 'setup-prettier-js)
(eval-after-load 'sgml-mode '(require 'setup-html-mode))
(eval-after-load 'shell '(require 'setup-shell))
(require 'smart-forward)
(require 'smex)
(smex-initialize)
(require 'smooth-scrolling)
(require 'string-inflection)
(require 'setup-tide)
(require 'visual-basic-mode)
(require 'visual-regexp)
(require 'setup-ws-butler)
(require 'setup-wgrep)
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

(put 'downcase-region 'disabled nil)

(require 'setup-personal)

(require 'unicode-fonts)
(unicode-fonts-setup)

(require 'projectile)
(setq projectile-indexing-method 'alien)
(define-key projectile-mode-map (kbd "C-c C-p") 'projectile-command-map)

;; Need to configure to define spec files, its set to NPM -> make it Aurelia
(defun my/related-files (&optional path)
  (if (and path (string-match (rx (group (or "src" "test")) (group "/" (1+ anything) ".cpp")) path))
      (let ((dir (match-string 1 path))
            (file-name (match-string 2 path)))
        (if (equal dir "test")
            (list :impl (concat "src" file-name))
          (list :test (concat "test" file-name)
                :other (concat "src" file-name ".def"))))))

(projectile-register-project-type
 ;; ...
 :related-files-fn #'my/related-files)


(add-to-list 'projectile-other-file-alist '("js" "html"))
(add-to-list 'projectile-other-file-alist '("html" "js"))

(use-package undo-tree
  ;; Represent undo-history as an actual tree (visualize with C-x u)
  :ensure
  :diminish
  :bind
  ("C-z" . undo-tree-undo)
  ("C-/" . nil)
  :config
  (global-undo-tree-mode))

(use-package uniquify
  :ensure nil
  :custom
  (uniquify-buffer-name-style 'forward "Add parts of each file's directory to the buffer name if not unique"))



;; See setup-debugger - check all hooks are using syntax from
;; https://github.com/nickmccurdy/add-hooks/blob/master/add-hooks.el
;;

;; check :ensure
;; not :ensure t
;; All non-bundled packages need :ensure to download them

;; Run eslisp lint over files
