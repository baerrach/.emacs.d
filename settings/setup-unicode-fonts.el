(require 'use-package)

;;; Installation

;; The package comments say to install fonts, but the links are out of date
;;
;; https://www.google.com/get/noto/
;; * Noto Sans
;; * Noto Sans Symbols
;;
;; https://dejavu-fonts.github.io/

(use-package persistent-soft
  )

(use-package unicode-fonts
  :after persistent-soft
  :config
  (unicode-fonts-setup))

(provide 'setup-unicode-fonts)
