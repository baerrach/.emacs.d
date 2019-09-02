(require 'use-package)

(use-package swiper
  :ensure
  :after ivy
  :bind (("C-s" . swiper)))

(provide 'setup-swiper)
