(require 'use-package)

(use-package multiple-cursors
  :ensure
  :after hydra
  :bind (("C-S-c C-S-c" . mc/edit-lines)
         ("C-c C-<" . mc/mark-all-like-this)
         ("C-S-<mouse-1>" . mc/add-cursor-on-click)
         ("C-c h m" . hydra-multiple-cursors/body)
         )
  :config
  (defhydra hydra-multiple-cursors (:hint nil)
    "
 Prev like this^   ^Next like this^   ^Mark all^           % 2(mc/num-cursors) cursor%s(if (> (mc/num-cursors) 1) \"s\" \"\")
------------------------------------------------------------------
 [_p_]   Next       [_n_]   Next       [_l_] Edit lines in region  [_0_] Insert numbers (use C-u to specify starting number)
 [_P_]   Skip       [_N_]   Skip       [_a_] Mark all like this    [_A_] Insert letters
 [_M-p_] Unmark     [_M-n_] Unmark     [_s_] Mark all in region regexp
 [Click] Cursor at point       [_q_] Quit"
    ("p" mc/mark-previous-like-this)
    ("P" mc/skip-to-previous-like-this)
    ("M-p" mc/unmark-previous-like-this)
    ("n" mc/mark-next-like-this)
    ("N" mc/skip-to-next-like-this)
    ("M-n" mc/unmark-next-like-this)
    ("l" mc/edit-lines :exit t)
    ("a" mc/mark-all-like-this :exit t)
    ("s" mc/mark-all-in-region-regexp :exit t)
    ("0" mc/insert-numbers :exit t)
    ("A" mc/insert-letters :exit t)
    ("<mouse-1>" mc/add-cursor-on-click)
    ;; Help with click recognition in this hydra
    ("<down-mouse-1>" ignore)
    ("<drag-mouse-1>" ignore)
    ("q" nil))
)

(provide 'setup-multiple-cursors)
