(require 'use-package)

(use-package projectile
  :after (ivy)
  :bind (:map projectile-mode-map
              ("C-c p" . projectile-command-map))
  :custom
  (projectile-mode-line-prefix " Ⓟ")
  (projectile-completion-system 'ivy)
  (projectile-indexing-method 'alien)
  ;; Teach Projectile about Aurelia related files:
  ;;
  ;; * View (.html) -> ViewModel (.js)
  (projectile-aurelia-related-files
   (list
    (projectile-related-files-fn-extensions :other '("html" "js"))))
  ;; Teach Projectile about Green Brain related files:
  ;;
  ;; JavaScript test files end in ".test" or ".spec"
  (greenbrain/related-files
        (list
          (projectile-related-files-fn-test-with-suffix "js" ".test")
          (projectile-related-files-fn-test-with-suffix "js" ".spec")
          ))
  :config
  (projectile-register-project-type 'aurelia '("aurelia_project/aurelia.json")
                                    :compile nil
                                    :test "npm test"
                                    :run "npm start"
                                    :test-suffix ".spec"
                                    :src-dir "src/"
                                    :test-dir "test/"
                                    :related-files-fn projectile-aurelia-related-files)

  (projectile-register-project-type 'npm '("package.json")
                                    :compile "npm install"
                                    :test "npm test"
                                    :test-dir "test/"
                                    :related-files-fn greenbrain/related-files)

  (defun my-projectile-invalidate-cache (&rest _args)
    ;; We ignore the args to `magit-checkout'.
    (projectile-invalidate-cache nil))

  (eval-after-load 'magit-branch
    '(progn
       (advice-add 'magit-checkout
                   :after #'my-projectile-invalidate-cache)
       (advice-add 'magit-branch-and-checkout
                   :after #'my-projectile-invalidate-cache)))

  (projectile-mode +1))

(provide 'setup-projectile)
