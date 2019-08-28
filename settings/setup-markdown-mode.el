(require 'use-package)

(use-package markdown-mode
  :ensure
  :commands markdown-mode
  :hook (markdown-mode . turn-on-auto-fill)
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
