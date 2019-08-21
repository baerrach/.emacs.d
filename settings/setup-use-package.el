(when (not (package-installed-p 'use-package))
  (package-install 'use-package))
(delete-other-windows)

(eval-when-compile
  (require 'use-package))

(provide 'setup-use-package)
