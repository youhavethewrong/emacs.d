;;; indium-autoloads.el --- automatically extracted autoloads
;;
;;; Code:
(add-to-list 'load-path (directory-file-name (or (file-name-directory #$) (car load-path))))

;;;### (autoloads nil "indium-interaction" "indium-interaction.el"
;;;;;;  (23385 60352 69104 856000))
;;; Generated autoloads from indium-interaction.el

(autoload 'indium-connect "indium-interaction" "\
Open a new connection to a runtime.

\(fn)" t nil)

(autoload 'indium-launch "indium-interaction" "\
Start a process (web browser or NodeJS) and attempt to connect to it.

\(fn)" t nil)

;;;***

;;;### (autoloads nil "indium-list-scripts" "indium-list-scripts.el"
;;;;;;  (23385 60352 88197 300000))
;;; Generated autoloads from indium-list-scripts.el

(autoload 'indium-list-scripts "indium-list-scripts" "\
Display a list of parsed scripts.

\(fn)" t nil)

;;;***

;;;### (autoloads nil "indium-scratch" "indium-scratch.el" (23385
;;;;;;  60352 86708 932000))
;;; Generated autoloads from indium-scratch.el

(autoload 'indium-scratch "indium-scratch" "\
Pop to the scratch buffer.
If no scratch buffer exists for the current connection, create
one first.

\(fn)" t nil)

;;;***

;;;### (autoloads nil nil ("indium-backend.el" "indium-breakpoint.el"
;;;;;;  "indium-chrome.el" "indium-debugger-frames.el" "indium-debugger-litable.el"
;;;;;;  "indium-debugger-locals.el" "indium-debugger.el" "indium-faces.el"
;;;;;;  "indium-inspector.el" "indium-nodejs.el" "indium-pkg.el"
;;;;;;  "indium-render.el" "indium-repl.el" "indium-script.el" "indium-seq-fix.el"
;;;;;;  "indium-sourcemap.el" "indium-structs.el" "indium-v8.el"
;;;;;;  "indium-workspace.el" "indium.el") (23385 60352 102620 974000))

;;;***

;; Local Variables:
;; version-control: never
;; no-byte-compile: t
;; no-update-autoloads: t
;; End:
;;; indium-autoloads.el ends here
