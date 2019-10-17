(require 'use-package)

(use-package indium
  :ensure
  :commands js2-mode
  :delight indium-interaction-mode " Indium"
  :hook (js2-mode . indium-interaction-mode)
  :config
  ;; selenium-utils needs the REPL environment set to something to run the debug REPL loop.
  (setenv "REPL" "1")

  (defun bae/indium-backend-evaluate (orig-indium-backend-evaluate backend string &optional callback)
    (when (string-match-p "^\\(const\\|let\\)\\W*" string)
      (setq string (replace-regexp-in-string "^\\(const\\|let\\)\\W*" "" string)))

    (when (string-match-p "^\\(\\w+\\W*=\\)?\\W*await" string)
      (message "Wrapping javascript in async block")
      (setq string (format "(async () => {%s; console.log('Wrapped async completed.');})();" string)))

    (funcall orig-indium-backend-evaluate backend string callback)
    )

  (defun bae/indium-debugger-select-frame (orig-indium-debugger-select-frame frame)
    "Copied from indium-debugger.el to remove download script source

Make FRAME the current debugged stack frame.

Setup a debugging buffer for the current stack FRAME and switch
to that buffer.

If no local file exists for the FRAME, ask the user if the remote
source for that frame should be downloaded.  If not, resume the
execution."
    (setq indium-debugger-current-frame frame)
    (switch-to-buffer (indium-debugger-get-buffer-create))
    (if buffer-file-name
        (indium-debugger-setup-buffer-with-file)
      (progn
        (if (and nil (yes-or-no-p "No file found for debugging (sourcemap issue?), download script source (might be slow)?"))
            (progn
              (message "Downloading script source for debugging...")
              (indium-client-get-frame-source
               frame
               (lambda (source)
                 (with-current-buffer (indium-debugger-get-buffer-create)
                   (indium-debugger-setup-buffer-with-source source))
                 (message "Downloading script source for debugging...done!"))))
          (indium-client-resume)))))

  (advice-add 'indium-backend-evaluate :around #'bae/indium-backend-evaluate)
  (advice-add 'indium-debugger-select-frame :around #'bae/indium-debugger-select-frame))


(provide 'setup-indium)
