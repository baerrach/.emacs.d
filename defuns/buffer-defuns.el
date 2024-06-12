;; Buffer-related defuns

(defun goto-line-with-feedback ()
  "Show line numbers temporarily, while prompting for the line number input"
  (interactive)
  (unwind-protect
      (progn
        (nlinum-mode 1)
        (call-interactively 'goto-line))
    (nlinum-mode -1)))
