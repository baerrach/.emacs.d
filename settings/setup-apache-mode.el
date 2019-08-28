(require 'use-package)

(use-package apache-mode
  :ensure
  :mode "\\.htaccess\\'\\|httpd\\.conf\\'\\|srm\\.conf\\'\\|access\\.conf\\'\\|sites-\\(available\\|enabled\\)/")

(provide 'setup-apache-mode)
