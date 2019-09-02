(require 'use-package)

(use-package swiper
  :ensure
  :after ivy
  :bind (("C-s" . swiper)
         ;; swiper opens a minbuffer it has no direction!
         ;; it automatically focuses on the current line
         ("C-r" . swiper)))

(provide 'setup-swiper)
