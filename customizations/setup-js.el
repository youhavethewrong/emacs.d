(require 'js)
(require 'flycheck)

;; javascript
(add-to-list 'auto-mode-alist '("\\.js$" . js-mode))
(add-hook 'js-mode-hook 'subword-mode)
(add-hook 'js-mode-hook 'prettier-js-mode)
(add-hook 'js-mode-hook (lambda () (auto-complete-mode 0)))
(add-hook 'js-mode-hook 'company-mode)
(add-hook 'js-mode-hook 'electric-pair-mode)
(add-hook 'js-mode-hook 'flycheck-mode)
(add-hook 'js-mode-hook 'js2-minor-mode)
(add-hook 'js-mode-hook 'js2-refactor-mode)
(add-to-list 'interpreter-mode-alist '("node" . js2-mode))

(setq js2-basic-offset 2)
(setq js-indent-level 2)
(define-key js-mode-map (kbd "TAB") #'company-indent-or-complete-common)
(setq company-tooltip-align-annotations t)

;; jsx
(add-to-list 'auto-mode-alist '("\\.jsx$" . rjsx-mode))
(add-hook 'rjsx-mode 'prettier-js-mode)
(add-hook 'rjsx-mode (lambda () (auto-complete-mode 0)))
(add-hook 'rjsx-mode 'company-mode)

;; html
(add-hook 'html-mode-hook 'subword-mode)
(eval-after-load "sgml-mode"
  '(progn
     (require 'tagedit)
     (tagedit-add-paredit-like-keybindings)
     (add-hook 'html-mode-hook (lambda () (tagedit-mode 1)))))
