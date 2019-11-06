(require 'use-package)

(use-package org
  :commands org-mode
  :bind (("C-c a" . org-agenda)
         ;; Disable archive keys
         ("<C-tab>" . nil)
         ("C-c $" . nil) ; disable org-archive-subtree
         ("C-c C-x A" . nil)
         ("C-c C-x C-s" . nil) ; disable org-archive-subtree
         ("C-c C-x a" . nil))
  :custom
  (org-clock-persist t "Save the running clock and all clock history when exiting Emacs, load it on startup")
  (org-clock-persist-query-resume nil "Do not prompt to resume an active clock")
  (org-clock-out-when-done t "Clock out when moving task to a done state")
  (org-clock-into-drawer t "Save clock data and state changes and notes in the LOGBOOK drawer")
  ;; Structure and Presentation
  (org-catch-invisible-edits t)
  (org-gotoauto-isearch nil)
  (org-startup-indented t "Indent the org tree")
  (org-hierarchical-todo-statistics nil "Roll up statistics")
  (org-columns-default-format "%80ITEM(Task) %10Effort(Effort){:} %10CLOCKSUM" "Set default column view headings: Task Effort Clock_Summary")
  ;; Dont insert blank lines
  (org-cycle-separator-lines 0)
  (org-blank-before-new-entry '((heading) (plain-list-item . auto)))
  ;; Export
  (org-export-initial-scope 'subtree)
  (org-html-doctype "html5")
  ;; Estimation
  (org-global-properties '(("Effort_ALL" . "0:15 0:30 1:00 2:00 4:00 1d 2d 4d 1w 2w 1m 0:00")) "global Effort estimate values")
  ;; Clock mode
  ;; 8 hours days
  (org-time-clocksum-use-effort-durations t)
  (org-effort-durations '(("min" . 1) ("h" . 60) ("d" . 480) ("w" . 2400) ("m" . 9600) ("y" . 96000)))
  :config
  (org-clock-persistence-insinuate))

(use-package org-bullets
  :hook (org-mode . org-bullets-mode))

;; Override org-html-table-cell defun as there is no other way to hook this functionality in.

(eval-after-load 'ox-html
  '(defun org-html-table-cell (table-cell contents info)
    "Transcode a TABLE-CELL element from Org to HTML.
CONTENTS is nil.  INFO is a plist used as a communication
channel."
    (let* ((table-row (org-export-get-parent table-cell))
           (table (org-export-get-parent-table table-cell))
           (cell-attrs "")
           (cells-attrs-list '())
           (key "")
           (value "")
           (key-and-value nil))
      (if (not org-html-table-align-individual-fields) nil
        (setq value (symbol-name (org-export-table-cell-alignment table-cell info)))
        (if (and (boundp 'org-html-format-table-no-css)
                 org-html-format-table-no-css)
            (setq key "align")
          (setq key "class"))
        (push (cons key value) cells-attrs-list))
      (when (or (not contents) (string= "" (org-trim contents)))
        (setq contents "&#xa0;"))
      ;; Replace heading * with &nbsp; (throw away the first two ** as headings start at this level)
      (if (string-prefix-p "*" contents)
          (setq contents (replace-regexp-in-string "\*" (apply 'concat (make-list 8 "&nbsp;")) (substring contents 2))))
      ;; Surround task status with css class for status
      (if (string-match "\\(TODO\\|DONE\\)" contents)
          (setq contents (replace-match "<span class=\"\\1\">\\1</span>" t nil contents)))
      ;; Surround task with css class for tags
      (if (string-match "\\(.*\\)\\s-+:\\([a-zA-Z0-9_@]+\\):" contents)
          (setq contents (replace-match "<span class=\"\\2\">\\1</span>" t nil contents)))
      (dolist (elt cells-attrs-list cell-attrs)
        (setq key-and-value elt)
        (setq cell-attrs (concat cell-attrs (format " %s=\"%s\"" (car key-and-value) (cdr key-and-value)))))
      (cond
       ((and (org-export-table-has-header-p table info)
             (= 1 (org-export-table-row-group table-row info)))
        (concat "\n" (format (car org-html-table-header-tags) "col" cell-attrs)
                contents (cdr org-html-table-header-tags)))
       ((and org-html-table-use-header-tags-for-first-column
             (zerop (cdr (org-export-table-cell-address table-cell info))))
        (concat "\n" (format (car org-html-table-header-tags) "row" cell-attrs)
                contents (cdr org-html-table-header-tags)))
       (t (concat "\n" (format (car org-html-table-data-tags) cell-attrs)
                  contents (cdr org-html-table-data-tags)))))))

(provide 'setup-org-mode)
