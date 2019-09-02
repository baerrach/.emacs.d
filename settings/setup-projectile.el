(require 'use-package)

(use-package projectile
  :ensure
  :after ivy
  :bind (:map projectile-mode-map
              ("C-c C-p" . projectile-command-map))
  :custom
  (projectile-completion-system 'ivy)
  (projectile-indexing-method 'alien)
  ;;   "Teach Projectile about Aurelia related files:
  ;;
  ;; * View (.html) -> ViewModel (.js)
  (projectile-aurelia-related-files
   (list
    (projectile-related-files-fn-extensions :other '("html" "js"))))
  :config
  (projectile-register-project-type 'aurelia '("aurelia_project/aurelia.json")
                                    :compile nil
                                    :test "npm test"
                                    :run "npm start"
                                    :test-suffix ".spec"
                                    :src-dir "src/"
                                    :test-dir "test/"
                                    :related-files-fn projectile-aurelia-related-files)
  )

(provide 'setup-projectile)
