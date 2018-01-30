;; Highlight matching parentheses when the point is on them.
(show-paren-mode 1)

(defmacro rename-modeline (package-name mode new-name)
  `(eval-after-load ,package-name
     '(defadvice ,mode (after rename-modeline activate)
        (setq mode-name ,new-name))))

(rename-modeline "js2-mode" js2-mode "JS2")

;;; https://stackoverflow.com/questions/2081577/setting-emacs-split-to-horizontal
;;; Always split horizontally (i.e. windows are left/right, not top/bottom on top of each other)
(setq split-height-threshold nil)
(setq split-width-threshold 0)

(provide 'appearance)
