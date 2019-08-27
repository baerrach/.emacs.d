(require 'use-package)

(use-package yasnippet
  :ensure
  :bind (:map yas-keymap
              ;; Jump to end of snippet definition
              ("<return>" . yas-exit-all-snippets)
              ("C-e" . yas-goto-end-of-active-field)
              ("C-a" . yas-goto-start-of-active-field)
              :map yas-minor-mode-map
              ;; Remap <tab> to <C-tab>
              ("<tab>" . nil)
              ("<C-tab>" . yas-expand)
              ("C-c <C-tab>" . yas-insert-snippet))
  :custom
  (yas-snippet-dirs '("~/.emacs.d/snippets") "Use only own snippets, do not use bundled ones")
  (yas-prompt-functions '(yas-ido-prompt) "No dropdowns please, yas")
  (yas-verbosity 1 "No need to be so verbose")
  (yas-wrap-around-region t "Wrap around region")

  :config
  (yas-global-mode 1)

  ;; Inter-field navigation
  (defun yas-goto-start-of-active-field ()
    (interactive)
    (let* ((snippet (car (yas--snippets-at-point)))
           (position (yas--field-start (yas--snippet-active-field snippet))))
      (if (= (point) position)
          (move-beginning-of-line 1)
        (goto-char position))))

  (defun yas-goto-end-of-active-field ()
    (interactive)
    (let* ((snippet (car (yas--snippets-at-point)))
           (position (yas--field-end (yas--snippet-active-field snippet))))
      (if (= (point) position)
          (move-end-of-line 1)
        (goto-char position)))))

(provide 'setup-yasnippet)
