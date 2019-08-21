(when (not (package-installed-p 'use-package))
  (package-install 'use-package))
(delete-other-windows)

(provide 'setup-use-package)
