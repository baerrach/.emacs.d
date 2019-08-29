(require 'use-package)

(use-package uniquify
  :ensure nil
  :custom
  (uniquify-buffer-name-style 'forward "Add parts of each file's directory to the buffer name if not unique"))

(provide 'setup-uniquify)
