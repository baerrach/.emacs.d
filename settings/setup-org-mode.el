;; Setup org-mode

(global-set-key "\C-ca" 'org-agenda)
(global-set-key "\C-cc" 'org-capture)

(setq 'org-catch-invisible-edits t)
(setq 'org-gotoauto-isearch nil)

;;; Structure and Presentation

;; Indent the org tree
(setq org-startup-indented t)

;; Dont insert blank lines
(setq org-cycle-separator-lines 0)
(setq org-blank-before-new-entry (quote ((heading)
                                         (plain-list-item . auto))))

;;; Estimation

;; global Effort estimate values
(setq org-global-properties (quote (("Effort_ALL" . "0:15 0:30 1:00 2:00 4:00 8:00 0:00"))))

;;; Column View

;; Set default column view headings: Task Effort Clock_Summary
(setq org-columns-default-format "%80ITEM(Task) %10Effort(Effort){:} %10CLOCKSUM")

;;; Clock mode

;; 8 hours days
(setq org-time-clocksum-use-effort-durations t)
(setq org-effort-durations (("h" . 60)
                            ("d" . 480)
                            ("w" . 2400)
                            ("m" . 9600)
                            ("y" . 96000)))

;; Save the running clock and all clock history when exiting Emacs, load it on startup
(setq org-clock-persist t)

;; Do not prompt to resume an active clock
(setq org-clock-persist-query-resume nil)

;; Start clocking from the last clock-out time, if any
(setq 'org-clock-continuously t)

;; Clock out when moving task to a done state
(setq org-clock-out-when-done t)

;; Save clock data and state changes and notes in the LOGBOOK drawer
(setq org-clock-into-drawer t)

(org-clock-persistence-insinuate)
(provide 'setup-org-mode)
