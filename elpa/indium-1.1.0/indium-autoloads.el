;;; indium-autoloads.el --- automatically extracted autoloads
;;
;;; Code:
(add-to-list 'load-path (directory-file-name (or (file-name-directory #$) (car load-path))))

;;;### (autoloads nil "indium-chrome" "indium-chrome.el" (23154 35038
;;;;;;  711274 285000))
;;; Generated autoloads from indium-chrome.el

(autoload 'indium-run-chrome "indium-chrome" "\
Start chrome/chromium with remote debugging enabled.
Open URL if provided.

\(fn URL)" t nil)

(autoload 'indium-connect-to-chrome "indium-chrome" "\
Open a connection to a v8 tab.

\(fn)" t nil)

;;;***

;;;### (autoloads nil "indium-list-scripts" "indium-list-scripts.el"
;;;;;;  (23154 35038 747273 928000))
;;; Generated autoloads from indium-list-scripts.el

(autoload 'indium-list-scripts "indium-list-scripts" "\
Display a list of parsed scripts.

\(fn)" t nil)

;;;***

;;;### (autoloads nil "indium-nodejs" "indium-nodejs.el" (23154 35038
;;;;;;  719274 206000))
;;; Generated autoloads from indium-nodejs.el

(autoload 'indium-run-node "indium-nodejs" "\
Start a NodeJS process.

Execute COMMAND, adding the `--inspect' flag.  When the process
is ready, open an Indium connection on it.

If `indium-nodejs-inspect-brk' is set to non-nil, break the
execution at the first statement.

If a connection is already open, close it.

\(fn COMMAND)" t nil)

(autoload 'indium-restart-node "indium-nodejs" "\
Restart the current nodejs process, and connect to it.

If no process has been started, or if it was not started using
`indium-run-node', do nothing.

\(fn)" t nil)

(autoload 'indium-connect-to-nodejs "indium-nodejs" "\
Open a connection to host:port/path.

\(fn)" t nil)

;;;***

;;;### (autoloads nil "indium-scratch" "indium-scratch.el" (23154
;;;;;;  35038 739274 7000))
;;; Generated autoloads from indium-scratch.el

(autoload 'indium-scratch "indium-scratch" "\
Pop to the scratch buffer.
If no scratch buffer exists for the current connection, create
one first.

\(fn)" t nil)

;;;***

;;;### (autoloads nil nil ("indium-backend.el" "indium-breakpoint.el"
;;;;;;  "indium-debugger-frames.el" "indium-debugger-litable.el"
;;;;;;  "indium-debugger-locals.el" "indium-debugger.el" "indium-faces.el"
;;;;;;  "indium-inspector.el" "indium-interaction.el" "indium-pkg.el"
;;;;;;  "indium-render.el" "indium-repl.el" "indium-script.el" "indium-seq-fix.el"
;;;;;;  "indium-sourcemap.el" "indium-structs.el" "indium-v8.el"
;;;;;;  "indium-workspace.el" "indium.el" "run-lint.el") (23154 35038
;;;;;;  779273 610000))

;;;***

;; Local Variables:
;; version-control: never
;; no-byte-compile: t
;; no-update-autoloads: t
;; End:
;;; indium-autoloads.el ends here
