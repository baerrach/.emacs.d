(require 'use-package)

(use-package explain-pause-mode
  :straight (explain-pause-mode :type git :host github :repo "lastquestion/explain-pause-mode")
  :config (explain-pause-mode))

(provide 'setup-explain-pause-mode)
