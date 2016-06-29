;;;;
;; All languages
;;;;
(add-hook 'prog-mode-hook 'idle-highlight-mode)

;; ;; regular auto-complete initialization
;;  (require 'auto-complete-config)
;;  (ac-config-default)

;; .m is for octave, not ObjC
(add-to-list 'auto-mode-alist '("\\.m$" . octave-mode))

;; .vm is for velocity templates
(require 'vtl)
(add-to-list 'auto-mode-alist '("\\.vm$" . turn-on-vtl-mode))

;; make java indentation friendly
(add-hook 'java-mode-hook (lambda ()
                            (setq c-basic-offset 4)))
