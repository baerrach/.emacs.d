For Windows you will need to have msysGit installed and on your PATH.

The Windows HOME environment variable must be set to something that you own or
you will get the "The directory <XXX> is unsafe".

This might not be C:\Users\<user>\AppData\Roaming as this might be owned by your local Admin user instead.

If you want to use that directory then as per
http://stackoverflow.com/questions/885793/emacs-error-when-calling-server-start
you will need to change the file's ownership to you.