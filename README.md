## Overview ##

Originally taken from Magnar's https://github.com/magnars/.emacs.d files (of
Emacs' Rocks and http://www.parens-of-the-dead.com/ fame)

After years of using this almost "out-of-the-box" I've taken the plunge to
migrate to using [use-package](https://github.com/jwiegley/use-package) and
harvesting useful pieces from the
author
[John Wiegley](https://github.com/jwiegley/dot-emacs/blob/master/init.el)'s
emacs files.

The benefit is now an emacs setup I have a better appreciation for, and one that
I can add to piece by piece. If you stumble across this repository then I
recommend that you start with the bare-bones of the `init.el` at the very top
that sets up `use-package`. From here work your way through each
`setup-*` file to determine whether you should harvest it into your emacs
workflow. Avoid wholesale copying of the repository because you will not
understand what it is doing and whether it will work for you. The upside of this
approach is you can then find other repositories with emacs setups and pull in
the bits that you need.

**TOOD** Scan through init.el and provide overview

* animated guide to paredit http://danmidwood.com/content/2014/11/21/animated-paredit.html
* smartparens by example https://ebzzry.io/en/emacs-pairs/
* avy (replaces ace jump)
* browse kill ring
* comment or uncomment region `C-c c`
* counsel - replaces some M-x commands to work better with ivy
* edit-server - edit text boxes from a Web Browser with Emacs
* expand region `er/` prefix, use `C-'` to `er/expand-region`
* guidekey - needs configuring. Work out which key sequences are used infrequently and would benefit from popups
* hydra - all hydra's heads should be prefixed to `C-c h <a key>`
* imenu - display list of things in the file in a hierarchical menu drilling down into each new level, useful in js2-mode and markdown-mode
* ivy - recent files added to switch buffer list.
* js2-mode - hydra for refactoring, bound to `C-c h r`
* moving faster `C-S-n` and `C-S-p`
* multiple cursors - hydra bound to `C-h h m`
* simplezen for html https://github.com/magnars/simplezen.el
* string inflection bound to `C-c C-u`, rotates through snake, camel, underscore casing.
* swiper - replaces isearch
* vlf - very large file handling
* visual regexp `vr/` prefix.
* webmode - see shortcut list (http://web-mode.org/)


### Trouble Shooting ###

```
;; TODO
;; Describe how to use use-package, i.e file in settings/setup-<package-name>.el, provide 'setup-<package-name>
;; Bundled packages must always have :ensure nil
;; Always use :after not :require
;; Always ensure any packages declared in :after also have use-package definitions
;; Order independent
;; Hooks: don't append '-hook' it wont work
;; Hooks: don't prepend functions with #' as it wont work, hooks expect symbols
;; Use commands: <mode-name>/command to defer loading until that command is invoked
```

#### Debugging ####

See [Function Debugging](https://www.gnu.org/software/emacs/manual/html_node/elisp/Function-Debugging.html) for more details.

Often you'll want to step into an emacs function to see what is going on.

From the `*.el` file you can locate the name of the funtion, then use `M-x debug-on-entry` and specify the function name.

Use `M-x cancel-debug-on-entry` to remove it.

## New tools to use ##

## TODO ##

Scan through init.el and pull out useful pieces

### Visual Regexp ###

`C-c m` for `vr/mc-mark` to prompt for visual regexp and then convert that to
multiple cursors.

`C-c r` for `vr/replace` and `C-c q` for `vr/query-replace`.
