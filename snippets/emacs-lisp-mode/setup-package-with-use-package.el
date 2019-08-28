# -*- mode: snippet -*-
# name: setup package with use package
# expand-env : ((yas-wrap-around-region nil))
# contributor: barrie.treloar@gmail.com
# --
(require 'use-package)

(use-package ${1:`(if (region-active-p)
    (yas-selected-text)
  (replace-regexp-in-string "^setup-" "" (file-name-nondirectory (file-name-sans-extension (buffer-file-name)))))
`}
  $0)

(provide 'setup-$1)
