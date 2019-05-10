(defun ispell-find-hunspell-dictionaries-use-nul (orig-fun &rest args)
  "Use Windows NUL and not /dev/null as the null-device."
  (let ((null-device "NUL"))
    (apply orig-fun args)))

(advice-add 'ispell-find-hunspell-dictionaries :around #'ispell-find-hunspell-dictionaries-use-nul)

(add-to-list 'exec-path "C:/Program Files/hunspell-1.3.2-3/bin/")

(setq ispell-program-name (executable-find "hunspell"))

(setq ispell-local-dictionary-alist '(
                                      (nil
                                       "[[:alpha:]]"
                                       "[^[:alpha:]]"
                                       "[']"
                                       t
                                       ("-d" "en_GB" "-p" "C:\\Program Files\\hunspell-1.3.2-3\\share\\hunspell")
                                       nil
                                       iso-8859-1)

                                      ("en_GB"
                                       "[[:alpha:]]"
                                       "[^[:alpha:]]"
                                       "[']"
                                       t
                                       ("-d" "en_GB" "-p" "C:\\Program Files\\hunspell-1.3.2-3\\share\\hunspell")
                                       nil
                                       iso-8859-1)
                                      ))

(ispell-change-dictionary "en_GB" t)

(require 'ispell)
(provide 'setup-hunspell)
