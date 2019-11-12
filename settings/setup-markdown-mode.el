(require 'use-package)

(use-package markdown-mode
  :after olivetti
  :commands markdown-mode
  :mode "\\.md'"
  :hook ((markdown-mode . turn-on-auto-fill)
         (markdown-mode . olivetti-mode))
  :custom
  (markdown-imenu-generic-expression
   '(("title"  "^\\(.*\\)[\n]=+$" 1)
     ("h2-"    "^\\(.*\\)[\n]-+$" 1)
     ("h1"   "^# \\(.*\\)$" 1)
     ("h2"   "^## \\(.*\\)$" 1)
     ("h3"   "^### \\(.*\\)$" 1)
     ("h4"   "^#### \\(.*\\)$" 1)
     ("h5"   "^##### \\(.*\\)$" 1)
     ("h6"   "^###### \\(.*\\)$" 1)
     ("fn"   "^\\[\\^\\(.*\\)\\]" 1)
     ))
  (imenu-generic-expression markdown-imenu-generic-expression)
  )

(provide 'setup-markdown-mode)
