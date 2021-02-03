;;;;
;; All languages
;;;;
(add-hook 'prog-mode-hook 'idle-highlight-mode)
(add-hook 'prog-mode-hook #'rainbow-delimiters-mode)

;; .m is for octave, not ObjC
(add-to-list 'auto-mode-alist '("\\.m$" . octave-mode))

;; subword hopping is nice
(add-hook 'java-mode-hook 'subword-mode)

;; use prettier-js with the prettier-js-java plugin to format
(add-hook 'java-mode-hook 'prettier-js-mode)

;; set a prompt for sybase
(setq sql-sybase-options '("--prompt=SQL> "))


;; Tell magit we know about the auto revert mode
(setq magit-last-seen-setup-instructions "1.4.0")

;; MAGIT PERFORMANCE TWEAKS
;; only refresh the current buffer
(setq magit-refresh-status-buffer nil)
;; don't automatically show me a diff
(remove-hook 'server-switch-hook 'magit-commit-diff)
;; disable vc for git.  magit is plenty.
(setq vc-handled-backends (delq 'Git vc-handled-backends))

(require 'string-inflection)
;; cycle through all string inflection styles
(global-set-key (kbd "C-c C-u") 'string-inflection-all-cycle)
