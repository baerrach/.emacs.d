(require 'use-package)

(use-package yasnippet
  :diminish yas-minor-mode
  :mode ("\\.yasnippet'" . snippet-mode)
  :hook (snippet-mode . yas-force-unix-buffer-file-coding-system)
  :bind (:map yas-keymap
              ;; Jump to end of snippet definition
              ("<return>" . yas-exit-all-snippets)
              ("C-e" . yas-goto-end-of-active-field)
              ("C-a" . yas-goto-start-of-active-field)
              :map yas-minor-mode-map
              ;; Remap <tab> to <C-tab>
              ("<tab>" . nil))
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
        (goto-char position))))

  (defun yas-force-unix-buffer-file-coding-system ()
    "Snippet files must be in UNIX line endings.

yasnippet does not support DOS line ending.
See https://github.com/joaotavora/yasnippet/issues/204#issuecomment-3167077"
    (set-buffer-file-coding-system 'unix t)))

(use-package ivy-yasnippet
  :after yasnippet ivy
  :bind (:map yas-minor-mode-map
              ("C-c <C-tab>" . ivy-yasnippet)))

(provide 'setup-yasnippet)
