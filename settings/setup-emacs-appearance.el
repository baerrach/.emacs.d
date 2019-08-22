;; Highlight matching parentheses when the point is on them.
(show-paren-mode 1)

;;;
;;; https://github.com/magnars/.emacs.d/blob/master/init.el
;;;

;;; https://stackoverflow.com/questions/2081577/setting-emacs-split-to-horizontal
;;; Always split horizontally (i.e. windows are left/right, not top/bottom on top of each other)
(setq split-height-threshold nil); originally 80

(provide 'setup-emacs-appearance)
