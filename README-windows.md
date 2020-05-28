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

;;
;; After saving file,
;; revert-buffer-with-coding-system windows-1250
;; To handle smart quotes
;; Not sure how to force that
;;
