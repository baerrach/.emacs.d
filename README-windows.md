### Git for Windows ###

For Windows you will need to have [Git for Windows](https://gitforwindows.org/) installed and on your PATH.

### Configure HOME environment variable ###

The Windows HOME environment variable must be set to something that you own or
you will get the "The directory <XXX> is unsafe".

This might not be C:\Users\<user>\AppData\Roaming as this might be owned by your local Admin user instead.

If you want to use that directory then as per
http://stackoverflow.com/questions/885793/emacs-error-when-calling-server-start
you will need to change the file's ownership to you.

Recommendation: Set HOME to C:\Users\<user>

### ag (the silver searcher) and Windows ###

Download and install the latest release of ag from  https://github.com/k-takata/the_silver_searcher-win32/releases into "C:\ag".

Edit the "User variables for <user>" > "Path" variable, and add a new entry for "C:\ag"

Restart emacs

### TODO: Handling smart quotes ###

;;
;; After saving file,
;; revert-buffer-with-coding-system windows-1250
;; To handle smart quotes
;; Not sure how to force that
;;

### ERROR: apply: Spawning child process: Invalid argument ###

Starting a shell `M-x shell`, starting a grep `M-x rgrep` and anything that spawns child processes fails with

```
apply: Spawning child process: Invalid argument

`M-x eshell` works.

`M-x toggle-debug-on-error` try again, see what is reported... Nothing.

The value of the bash binary is hard coded, make sure the bash binary is installed at:

```
  (setq explicit-shell-file-name "C:/Program Files/Git/bin/bash.exe")
```
