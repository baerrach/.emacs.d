(eval-after-load 'grep
  '(progn
     (add-to-list 'grep-find-ignored-directories ".cache")
     (add-to-list 'grep-find-ignored-directories "build")
     (add-to-list 'grep-find-ignored-directories "coverage")
     (add-to-list 'grep-find-ignored-directories "dist")
     (add-to-list 'grep-find-ignored-directories "elpa")
     (add-to-list 'grep-find-ignored-directories "img")
     (add-to-list 'grep-find-ignored-directories "lib")
     (add-to-list 'grep-find-ignored-directories "libs")
     (add-to-list 'grep-find-ignored-directories "node_modules")
     (add-to-list 'grep-find-ignored-directories "static")
     (add-to-list 'grep-find-ignored-directories "umd")
     (add-to-list 'grep-find-ignored-directories "vendor")
     ))

(add-hook 'grep-mode-hook (lambda ()
                            (visual-line-mode)))
(provide 'setup-grep)
