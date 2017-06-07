(eval-after-load 'grep
  '(progn
     (add-to-list 'grep-find-ignored-directories "build")
     (add-to-list 'grep-find-ignored-directories "elpa")
     (add-to-list 'grep-find-ignored-directories "node_modules")
     (add-to-list 'grep-find-ignored-directories "vendor")
     ))

(add-hook 'grep-mode-hook (lambda ()
                            (visual-line-mode)))
(provide 'setup-grep)
