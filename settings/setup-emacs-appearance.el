;; Highlight matching parentheses when the point is on them.
(show-paren-mode 1)

;; TODO: Replace with diminish and delight
(defmacro rename-modeline (package-name mode new-name)
  `(eval-after-load ,package-name
     '(defadvice ,mode (after rename-modeline activate)
        (setq mode-name ,new-name))))

;; TODO: Replace with diminish and delight
(rename-modeline "js2-mode" js2-mode "JS2")

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
