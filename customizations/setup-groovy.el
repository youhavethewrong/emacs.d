;; groovy / grails
(add-to-list 'auto-mode-alist '("\\.groovy$" . groovy-mode))
(add-to-list 'interpreter-mode-alist '("groovy" . groovy-mode))

(add-hook 'groovy-mode-hook 'subword-mode)
(add-hook 'groovy-mode-hook 'auto-complete-mode)
(add-hook 'groovy-mode-hook (lambda () (setq c-basic-offset 4)))

(require 'eclim)
(add-hook 'groovy-mode-hook 'eclim-mode)
