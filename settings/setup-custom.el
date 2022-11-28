;; Keep emacs Custom-settings in separate file
(setq custom-file (expand-file-name "custom.el" user-emacs-directory))

(if (file-exists-p custom-file)
	(load custom-file))

(provide 'setup-custom)
