;; Use customize-face instead
;; -22- === 166 in 1/10 pt

;; friendly font
(defun bae/work-settings ()
  (interactive)
  (setq bae/default-font "-outline-Consolas-normal-normal-normal-mono-22-*-*-*-c-*-iso8859-1")
  (set-face-attribute 'default nil :font bae/default-font)
  (set-face-attribute 'mode-line nil :font bae/default-font))

(defun bae/home-settings ()
  (interactive)
  (setq bae/default-font "-outline-Consolas-normal-normal-normal-mono-54-*-*-*-c-*-iso8859-1")
  (set-face-attribute 'default nil :font bae/default-font)
  (set-face-attribute 'mode-line nil :font bae/default-font))


(provide 'setup-personal)
