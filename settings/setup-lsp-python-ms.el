(require 'use-package)

(use-package lsp-python-ms
  :hook (python-mode . lsp)
;  :custom
;  (lsp-python-ms-executable
;      "C:/mspyls/Microsoft.Python.LanguageServer.exe")
  )

(provide 'setup-lsp-python-ms)
