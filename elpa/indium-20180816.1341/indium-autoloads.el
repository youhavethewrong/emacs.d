;;; indium-autoloads.el --- automatically extracted autoloads
;;
;;; Code:
(add-to-list 'load-path (directory-file-name (or (file-name-directory #$) (car load-path))))

;;;### (autoloads nil "indium-interaction" "indium-interaction.el"
;;;;;;  (23413 52220 565843 126000))
;;; Generated autoloads from indium-interaction.el

(autoload 'indium-connect "indium-interaction" "\
Open a new connection to a runtime.

\(fn)" t nil)

(autoload 'indium-launch "indium-interaction" "\
Start a new process and connect to it.

\(fn)" t nil)

;;;***

;;;### (autoloads nil "indium-list-sources" "indium-list-sources.el"
;;;;;;  (23413 52220 533929 903000))
;;; Generated autoloads from indium-list-sources.el

(autoload 'indium-list-sourcemap-sources "indium-list-sources" "\
Display a list of all resolved sourcemap sources.

\(fn)" t nil)

(autoload 'indium-list-script-sources "indium-list-sources" "\
Display a list of all resolved script sources.

\(fn)" t nil)

;;;***

;;;### (autoloads nil "indium-scratch" "indium-scratch.el" (23413
;;;;;;  52220 543210 818000))
;;; Generated autoloads from indium-scratch.el

(autoload 'indium-scratch "indium-scratch" "\
Pop to the scratch buffer.
If no scratch buffer exists for the current connection, create
one first.

\(fn)" t nil)

;;;***

;;;### (autoloads nil nil ("indium-breakpoint.el" "indium-chrome.el"
;;;;;;  "indium-client.el" "indium-debugger-litable.el" "indium-debugger-locals.el"
;;;;;;  "indium-debugger.el" "indium-faces.el" "indium-inspector.el"
;;;;;;  "indium-nodejs.el" "indium-pkg.el" "indium-render.el" "indium-repl.el"
;;;;;;  "indium-seq-fix.el" "indium-structs.el" "indium.el") (23413
;;;;;;  52220 569569 341000))

;;;***

;; Local Variables:
;; version-control: never
;; no-byte-compile: t
;; no-update-autoloads: t
;; End:
;;; indium-autoloads.el ends here
