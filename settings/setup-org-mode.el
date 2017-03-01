;; Setup org-mode

(global-set-key "\C-ca" 'org-agenda)
(global-set-key "\C-cc" 'org-capture)

(setq org-catch-invisible-edits t)
(setq org-gotoauto-isearch nil)

;;; Structure and Presentation

;; Indent the org tree
(setq org-startup-indented t)

;; Dont insert blank lines
(setq org-cycle-separator-lines 0)
(setq org-blank-before-new-entry (quote ((heading)
                                         (plain-list-item . auto))))

(require 'org-bullets)
(add-hook 'org-mode-hook (lambda () (org-bullets-mode 1)))

(setq org-export-initial-scope 'subtree)
(setq org-html-doctype "html5")

;;; Estimation

;; global Effort estimate values
(setq org-global-properties (quote (("Effort_ALL" . "0:15 0:30 1:00 2:00 4:00 1d 2d 4d 1w 2w 1m 0:00"))))

;; Roll up statistics
(setq org-hierarchical-todo-statistics nil)

;;; Column View

;; Set default column view headings: Task Effort Clock_Summary
(setq org-columns-default-format "%80ITEM(Task) %10Effort(Effort){:} %10CLOCKSUM")

;;; Clock mode

;; 8 hours days
(setq org-time-clocksum-use-effort-durations t)
(setq org-effort-durations (quote (("min" . 1)
                             ("h" . 60)
                             ("d" . 480)
                             ("w" . 2400)
                             ("m" . 9600)
                             ("y" . 96000))))

;; Save the running clock and all clock history when exiting Emacs, load it on startup
(setq org-clock-persist t)

;; Do not prompt to resume an active clock
(setq org-clock-persist-query-resume nil)

;; Clock out when moving task to a done state
(setq org-clock-out-when-done t)

;; Save clock data and state changes and notes in the LOGBOOK drawer
(setq org-clock-into-drawer t)

(org-clock-persistence-insinuate)

;; Override org-html-table-cell defun as there is no other way to hook this functionality in.

(eval-after-load "org-mode"
  (defun org-html-table-cell (table-cell contents info)
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
