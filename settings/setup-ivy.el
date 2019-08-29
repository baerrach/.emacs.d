(require 'use-package)

(use-package ivy
  :ensure
  :custom
  (ivy-use-virtual-buffers t)
  (enable-recursive-minibuffers t)
  (smex-completion-method 'ivy)
  ; (smex-completion-method 'ido)
  :config
  (defcustom smex-completion-method 'ido
    "Method to select a candidate from a list of strings."
    :type '(choice
            (const :tag "Ido" ido)
            (const :tag "Ivy" ivy)))

  (defvar ivy-hack--smex-map (let ((map (make-sparse-keymap)))
                               (define-key map (kbd "TAB") 'minibuffer-complete)
                               (define-key map (kbd "C-h f") 'smex-describe-function)
                               (define-key map (kbd "C-h w") 'smex-where-is)
                               (define-key map (kbd "M-.") 'smex-find-function)
                               (define-key map (kbd "C-a") 'move-beginning-of-line)
                               map)
    "Keymap used in the minibuffer.")

  (defun ivy-hack--smex-prepare-ido-bindings ()
    (setq ido-completion-map
          (make-composed-keymap '(ivy-hack--smex-map ido-completion-map))))

  (declare-function ivy-read "ext:ivy")
  (declare-function ivy-done "ext:ivy")

  (defun ivy-hack--smex-completing-read--before-until (choices initial-input)
    (when (eq smex-completion-method 'ivy)
      (ivy-read (smex-prompt-with-prefix-arg) choices
                :keymap ivy-hack--smex-map
                :history 'extended-command-history
                :preselect (car choices))))
  (advice-add 'smex-completing-read :before-until #'ivy-hack--smex-completing-read--before-until)

  (defun ivy-hack--smex-do-with-selected-item--before-until (fn)
    (when (eq smex-completion-method 'ivy)
      (setq smex-custom-action fn)
      (ivy-done)))
  (advice-add 'smex-do-with-selected-item :before-until #'ivy-hack--smex-do-with-selected-item--before-until)

  (ivy-mode 1))

(provide 'setup-ivy)
