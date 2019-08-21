;;; Enable for debugging problems
;; (setq debug-on-quit t)
;; (setq debug-on-error t)

;; Added by Package.el.  This must come before configurations of
;; installed packages.  Don't delete this line.  If you don't want it,
;; just comment it out by adding a semicolon to the start of the line.
;; You may delete these explanatory comments.
(package-initialize)

;; Set path to dependencies
(setq site-lisp-dir
      (expand-file-name "site-lisp" user-emacs-directory))

(setq settings-dir
      (expand-file-name "settings" user-emacs-directory))

;; Set up load path
(add-to-list 'load-path settings-dir)
(add-to-list 'load-path site-lisp-dir)

(require 'setup-emacs-server)

(add-hook 'debugger-mode-hook 'turn-on-visual-line-mode)

;;;
;;; Desktop save mode
;;; http://ergoemacs.org/emacs/emacs_save_restore_opened_files.html
;;;
;; save/restore opened files and windows config
(desktop-save-mode 1) ; 0 for off

;; Keep emacs Custom-settings in separate file
(setq custom-file (expand-file-name "custom.el" user-emacs-directory))
(load custom-file)

;; Set up appearance early
(require 'setup-emacs-appearance)

;; Save point position between sessions
(require 'saveplace)
(setq-default save-place t)

;; What system are we on?
(setq is-mac (equal system-type 'darwin))
(setq is-win (equal system-type 'windows-nt))

;; Setup packages
(require 'setup-package)

;; TODO: Refactor to setup-* and using use-package
;; Install extensions if they're missing
;; (defun init--install-packages ()
;;   (packages-install
;;    '(ace-jump-buffer
;;      ace-jump-mode
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

;; Functions (load all files in defuns-dir)
(setq defuns-dir (expand-file-name "defuns" user-emacs-directory))
(dolist (file (directory-files defuns-dir t "\\w+"))
  (when (file-regular-p file)
    (load file)))

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


;; Highlight escape sequences
(require 'highlight-escape-sequences)
(hes-mode)
(put 'font-lock-regexp-grouping-backslash 'face-alias 'font-lock-builtin-face)

(require 're-builder)
(setq reb-re-syntax 'string)

;; Setup extensions
(require 'ace-jump-mode)
(require 'setup-company)
(eval-after-load 'dired '(require 'setup-dired))
(eval-after-load 'find-file-in-project '(require 'setup-find-file-in-project))
(require 'expand-region)
(eval-after-load 'flycheck '(require 'setup-flycheck))
(eval-after-load 'grep '(require 'setup-grep))
(require 'setup-hippie-expand)
(require 'setup-hunspell)
(eval-after-load 'ido '(require 'setup-ido))
(require 'setup-indium)
(eval-after-load 'magit '(require 'setup-magit))
(require 'multiple-cursors)
(require 'setup-lsp)
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
(defun my/related-files (path)
  (if (string-match (rx (group (or "src" "test")) (group "/" (1+ anything) ".cpp")) path)
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
