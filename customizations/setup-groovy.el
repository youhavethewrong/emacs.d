;; groovy / grails
(add-to-list 'auto-mode-alist '("\\.groovy$" . groovy-mode))
(add-hook 'groovy-mode-hook 'groovy-electric-mode)
(add-hook 'groovy-mode-hook 'subword-mode)
(add-to-list 'interpreter-mode-alist '("groovy" . groovy-mode))
