(require 'use-package)

(use-package projectile
  :ensure
  :after ivy
  :bind (:map projectile-mode-map
              ("C-c C-p" . projectile-command-map))
  :custom
  (projectile-completion-system 'ivy)
  (projectile-indexing-method 'alien)
  :config
  (defun my-projectile-invalidate-cache (&rest _args)
    ;; We ignore the args to `magit-checkout'.
    (projectile-invalidate-cache nil))

  (eval-after-load 'magit-branch
    '(progn
       (advice-add 'magit-checkout
                   :after #'my-projectile-invalidate-cache)
       (advice-add 'magit-branch-and-checkout
                   :after #'my-projectile-invalidate-cache))))

(provide 'setup-projectile)

;; ;; Need to configure to define spec files, its set to NPM -> make it Aurelia
;; (defun my/related-files (&optional path)
;;   (if (and path (string-match (rx (group (or "src" "test")) (group "/" (1+ anything) ".cpp")) path))
;;       (let ((dir (match-string 1 path))
;;             (file-name (match-string 2 path)))
;;         (if (equal dir "test")
;;             (list :impl (concat "src" file-name))
;;           (list :test (concat "test" file-name)
;;                 :other (concat "src" file-name ".def"))))))

;; (projectile-register-project-type
;;  ;; ...
;;  :related-files-fn #'my/related-files)


;; (add-to-list 'projectile-other-file-alist '("js" "html"))
;; (add-to-list 'projectile-other-file-alist '("html" "js"))
