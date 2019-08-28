;;; setup-js2-mode.el --- tweak js2 settings -*- lexical-binding: t; -*-

(use-package js2-mode
  :ensure
  :commands js2-mode
  :mode "\\.js\\'\\|\\.gs\\'"
  :delight js2-mode "JS2"
  :custom
  (js-indent-level 2)
  (js2-allow-rhino-new-expr-initializer nil)
  (js2-auto-indent-p nil)
  (js2-enter-indents-newline nil)
  (js2-global-externs '("module" "require"))
  (js2-idle-timer-delay 0.1)
  (js2-indent-on-enter-key nil)
  (js2-mirror-mode nil)
  (js2-strict-inconsistent-return-warning nil)
  (js2-auto-indent-p t)
  (js2-include-rhino-externs nil)
  (js2-include-gears-externs nil)
  (js2-concat-multiline-strings 'eol)
  (js2-rebind-eol-bol-keys nil)
  ;; Let flycheck handle parse errors
  (js2-show-parse-errors nil)
  (js2-strict-missing-semi-warning nil)
  (js2-strict-trailing-comma-warning nil)
  :config
  )

(use-package js2-imenu-extras
  :ensure nil ; part of js2-mode
  :after js2-mode
  :commands js2-mode
  :config
  (js2-imenu-extras-setup))

(use-package js2-refactor
  :ensure
  :after (js2-mode hydra)
  :commands js2-mode
  :bind (:map js2-mode-map
              ("C-k" . js2r-kill)
              ("C-c h r" . hydra-js2-refactor/body))
  :config
  (defhydra hydra-js2-refactor (:color blue :hint nil)
    "
^Functions^                    ^Variables^               ^Buffer^                      ^sexp^               ^Debugging^
------------------------------------------------------------------------------------------------------------------------------
[_lp_] Localize Parameter      [_ev_] Extract variable   [_wi_] Wrap buffer in IIFE    [_k_]  js2 kill      [_lt_] log this
[_ef_] Extract function        [_iv_] Inline variable    [_ig_] Inject global in IIFE  [_ss_] Split string  [_dt_] debug this
[_ip_] Introduce parameter     [_rv_] Rename variable    [_ee_] Expand node at point   [_sl_] Forward slurp
[_em_] Extract method          [_vt_] Var to this        [_cc_] Contract node at point [_ba_] Forward barf
[_ao_] Arguments to object     [_sv_] Split var decl.    [_uw_] Unwrap
[_tf_] Toggle fun exp and decl [_ag_] Add var to globals
[_ta_] Toggle fun expr and =>  [_ti_] Ternary to if
[_q_]  Quit"
    ("ee" js2r-expand-node-at-point)
    ("cc" js2r-contract-node-at-point)
    ("ef" js2r-extract-function)
    ("em" js2r-extract-method)
    ("tf" js2r-toggle-function-expression-and-declaration)
    ("ta" js2r-toggle-arrow-function-and-expression)
    ("ip" js2r-introduce-parameter)
    ("lp" js2r-localize-parameter)
    ("wi" js2r-wrap-buffer-in-iife)
    ("ig" js2r-inject-global-in-iife)
    ("ag" js2r-add-to-globals-annotation)
    ("ev" js2r-extract-var)
    ("iv" js2r-inline-var)
    ("rv" js2r-rename-var)
    ("vt" js2r-var-to-this)
    ("ao" js2r-arguments-to-object)
    ("ti" js2r-ternary-to-if)
    ("sv" js2r-split-var-declaration)
    ("ss" js2r-split-string)
    ("uw" js2r-unwrap)
    ("lt" js2r-log-this)
    ("dt" js2r-debug-this)
    ("sl" js2r-forward-slurp)
    ("ba" js2r-forward-barf)
    ("k" js2r-kill)
    ("q" nil)))

(defun bae-disable-js2-mode-helpers ()
  "Disable Flycheck, Prettier, WS-butler"
  (interactive)
  (progn
    (flycheck-mode -1)
    (prettier-js-mode -1)
    (ws-butler-mode -1)))

(provide 'setup-js2-mode)
