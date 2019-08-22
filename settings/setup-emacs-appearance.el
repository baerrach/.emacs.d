;; Highlight matching parentheses when the point is on them.
(show-paren-mode 1)

;;;
;;; https://github.com/magnars/.emacs.d/blob/master/init.el
;;;

;;; https://stackoverflow.com/questions/2081577/setting-emacs-split-to-horizontal
;;; Always split horizontally (i.e. windows are left/right, not top/bottom on top of each other)
(setq split-height-threshold nil); originally 80

;; TODO: Check how solarized is installed
;; Needs installing M-x package-install solarized-theme

;; Setup theme
(add-to-list 'custom-theme-load-path "~/.emacs.d/themes/")
(setq frame-background-mode 'dark)
(load-theme 'solarized t)

(provide 'setup-emacs-appearance)
