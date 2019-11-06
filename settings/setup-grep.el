(require 'use-package)

;; TODO replace with ag

(use-package grep
  :hook (grep-mode . turn-on-visual-line-mode)
  :config
  (add-to-list 'grep-find-ignored-directories ".cache")
  (add-to-list 'grep-find-ignored-directories "build")
  (add-to-list 'grep-find-ignored-directories "coverage")
  (add-to-list 'grep-find-ignored-directories "dist")
  (add-to-list 'grep-find-ignored-directories "elpa")
  (add-to-list 'grep-find-ignored-directories "jspm_packages")
  (add-to-list 'grep-find-ignored-directories "img")
  (add-to-list 'grep-find-ignored-directories "lib")
  (add-to-list 'grep-find-ignored-directories "libs")
  (add-to-list 'grep-find-ignored-directories "node_modules")
  (add-to-list 'grep-find-ignored-directories "static")
  (add-to-list 'grep-find-ignored-directories "umd")
  (add-to-list 'grep-find-ignored-directories "vendor"))

(provide 'setup-grep)
