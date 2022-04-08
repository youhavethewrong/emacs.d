;;; js-auto-beautify-autoloads.el --- automatically extracted autoloads
;;
;;; Code:

(add-to-list 'load-path (directory-file-name
                         (or (file-name-directory #$) (car load-path))))


;;;### (autoloads nil "js-auto-beautify" "js-auto-beautify.el" (0
;;;;;;  0 0 0))
;;; Generated autoloads from js-auto-beautify.el

(autoload 'js-auto-beautify-mode "js-auto-beautify" "\
auto-beautify you js/jsx

If called interactively, enable Js-Auto-Beautify mode if ARG is
positive, and disable it if ARG is zero or negative.  If called
from Lisp, also enable the mode if ARG is omitted or nil, and
toggle it if ARG is `toggle'; disable the mode otherwise.

\(fn &optional ARG)" t nil)

(if (fboundp 'register-definition-prefixes) (register-definition-prefixes "js-auto-beautify" '("js-auto-beautify-")))

;;;***

;; Local Variables:
;; version-control: never
;; no-byte-compile: t
;; no-update-autoloads: t
;; coding: utf-8
;; End:
;;; js-auto-beautify-autoloads.el ends here
