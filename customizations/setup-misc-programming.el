;;;;
;; All languages
;;;;
(add-hook 'prog-mode-hook 'idle-highlight-mode)

(require 'column-marker)
(add-hook 'prog-mode-hook (lambda () (interactive) (column-marker-3 132)))

;; ;; regular auto-complete initialization
;;  (require 'auto-complete-config)
;;  (ac-config-default)

;; .m is for octave, not ObjC
(add-to-list 'auto-mode-alist '("\\.m$" . octave-mode))

;; make java indentation friendly
(add-hook 'java-mode-hook (lambda ()
                            (setq c-basic-offset 4)))

;; subword hopping is nice
(add-hook 'java-mode-hook 'subword-mode)

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
