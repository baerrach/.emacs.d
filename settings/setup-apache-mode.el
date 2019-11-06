(require 'use-package)

(use-package apache-mode
  :mode "\\.htaccess\\'\\|httpd\\.conf\\'\\|srm\\.conf\\'\\|access\\.conf\\'\\|sites-\\(available\\|enabled\\)/")

(provide 'setup-apache-mode)
