(require 'use-package)

;; TODO - migrate to IVY

;; Interactively Do Things
(use-package ido
  :bind (:map ido-file-completion-map
              ("~" . my/ido-go-straight-home)
              ("C-~" . my/ido-go-straight-home)
              ;; Use C-w to go back up a dir to better match normal usage of C-w
              ;; - insert current file name with C-x C-w instead.
              ("C-w" . ido-delete-backward-updir)
              ("C-x C-w" . ido-copy-current-file-name)
              ("M-b" . backward-word)
              :map ido-file-dir-completion-map
              ("C-w" . ido-delete-backward-updir)
              ("C-x C-w" . ido-copy-current-file-name)
              ;:map ido-completion-map
              ;("<tab>" . ido-complete)
              )
  :custom
  (ido-enable-prefix nil)
  (ido-enable-flex-matching t)
  (ido-case-fold nil)
  (ido-auto-merge-work-directories-length -1)
  (ido-create-new-buffer 'always)
  (ido-use-filename-at-point nil)
  (ido-max-prospects 10)
  (ido-use-faces nil "disable ido faces to see flx highlights")
  (ido-vertical-define-keys 'C-n-C-p-up-down-left-right "C-n/p is more intuitive in vertical layout")
  (imenu-auto-rescan t "Always rescan buffer for imenu")

  :config
  (ido-mode 1)
  (ido-everywhere 1)

  (defun my/ido-go-straight-home ()
    (interactive)
    (cond
     ((looking-back "/") (insert "~/"))
     (:else (call-interactively 'self-insert-command))))

  (add-to-list 'ido-ignore-directories "target")
  (add-to-list 'ido-ignore-directories "node_modules"))

(use-package flx-ido
  ;; Try out flx-ido for better flex matching between words
  :after (flx ido)
  :config
  (flx-ido-mode 1))

(use-package ido-vertical-mode
  ;; flx-ido looks better with ido-vertical-mode
  :after (ido)
  :config
  (ido-vertical-mode))

(use-package ido-at-point
  ;; Ido at point C-M-i
  :after (ido)
  :config
  (ido-at-point-mode 1))

(use-package ido-completing-read+
  ;; Use ido everywhere
  :after (ido)
  :config
  (ido-ubiquitous-mode 1)

  ;; Fix ido-ubiquitous for newer packages
  (defmacro ido-ubiquitous-use-new-completing-read (cmd package)
    `(eval-after-load ,package
       '(defadvice ,cmd (around ido-ubiquitous-new activate)
          (let ((ido-ubiquitous-enable-compatibility nil))
            ad-do-it))))

  (ido-ubiquitous-use-new-completing-read webjump 'webjump)
  (ido-ubiquitous-use-new-completing-read yas-expand 'yasnippet)
  (ido-ubiquitous-use-new-completing-read yas-visit-snippet-file 'yasnippet))

(provide 'setup-ido)
