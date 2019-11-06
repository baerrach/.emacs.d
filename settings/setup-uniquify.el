(require 'use-package)

(straight-use-package '(uniquify :type built-in))

(use-package uniquify
  :custom
  (uniquify-buffer-name-style 'forward "Add parts of each file's directory to the buffer name if not unique"))

(provide 'setup-uniquify)
