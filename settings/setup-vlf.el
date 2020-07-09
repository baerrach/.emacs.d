(require 'use-package)

(use-package vlf
  :after (hydra)
  :config
  (require 'vlf-setup)
  (defhydra hydra-vlf (:color blue :hint nil)
    "Very Large File"
    ("s" vlf-re-search-forward "search forward" :column "Search" :color pink)
    ("r" vlf-re-search-backward "search backward" :color pink)
    ("o" vlf-occur "occur")
    ("g" vlf-goto-line "goto line")
    ("n" vlf-next-batch "next batch" :column "Batch")
    ("p" vlf-prev-batch "previous batch")
    ("j" vlf-jump-to-chunk "jump to batch number")
    ("[" vlf-beginning-of-file "beginning of file" :column "Movement")
    ("]" vlf-end-of-file "end of file")
    ("q" nil "quit" :column nil)))

(provide 'setup-vlf)
