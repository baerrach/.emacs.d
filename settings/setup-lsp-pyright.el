(require 'use-package)

; Requires 
; * Node https://nodejs.org/en/download
; * Pyright 
;   pip install pyright
(use-package lsp-pyright
  :hook (python-mode . (lambda ()
                         (require 'lsp-pyright)
                         (lsp))))  ; or lsp-deferred

(provide 'setup-lsp-pyright)
