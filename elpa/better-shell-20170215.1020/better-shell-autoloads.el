;;; better-shell-autoloads.el --- automatically extracted autoloads
;;
;;; Code:
(add-to-list 'load-path (directory-file-name (or (file-name-directory #$) (car load-path))))

;;;### (autoloads nil "better-shell" "better-shell.el" (23082 47285
;;;;;;  218570 133000))
;;; Generated autoloads from better-shell.el

(autoload 'better-shell-remote-open "better-shell" "\
Prompt for a remote host to connect to, and open a shell
there.  With prefix argument, get a sudo shell.

\(fn &optional ARG)" t nil)

(autoload 'better-shell-sudo-here "better-shell" "\
Reopen the current file, directory, or shell as root.  For
files and dired buffers, the non-sudo buffer is replaced with a
sudo buffer.  For shells, a sudo shell is opened but the non-sudo
shell is left in tact.

\(fn)" t nil)

(autoload 'better-shell-shell "better-shell" "\
Pop to an appropriate shell.
Cycle through all the shells, most recently used first.  When
called with a prefix ARG, finds or creates a shell in the current
directory.

\(fn &optional ARG)" t nil)

;;;***

;; Local Variables:
;; version-control: never
;; no-byte-compile: t
;; no-update-autoloads: t
;; End:
;;; better-shell-autoloads.el ends here
