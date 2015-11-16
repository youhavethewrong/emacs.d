;;;;
;; All languages
;;;;
(add-hook 'prog-mode-hook 'idle-highlight-mode)

;; ;; regular auto-complete initialization
;;  (require 'auto-complete-config)
;;  (ac-config-default)

;; .m is for octave, not ObjC
(add-to-list 'auto-mode-alist '("\\.m$" . octave-mode))
