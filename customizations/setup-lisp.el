;; Automatically load paredit when editing a lisp file
;; More at http://www.emacswiki.org/emacs/ParEdit
(use-package paredit
  :defer t
  :diminish "⒫"
  :init
  (add-hook 'lisp-mode-hook             #'enable-paredit-mode)
  (add-hook 'emacs-lisp-mode-hook       #'enable-paredit-mode)
  (add-hook 'eval-expression-minibuffer-setup-hook #'enable-paredit-mode)
  (add-hook 'lisp-interaction-mode-hook #'enable-paredit-mode)
  (add-hook 'scheme-mode-hook           #'enable-paredit-mode)
  (add-hook 'emacs-lisp-mode-hook 'turn-on-eldoc-mode)
  (add-hook 'lisp-interaction-mode-hook 'turn-on-eldoc-mode)
  (add-hook 'ielm-mode-hook 'turn-on-eldoc-mode)
  :config
  (global-set-key (kbd "S-M-i") 'paredit-backward-slurp-sexp)
  (global-set-key (kbd "S-M-o") 'paredit-forward-slurp-sexp)
  (global-set-key (kbd "C-M-i") 'paredit-backward-barf-sexp)
  (global-set-key (kbd "C-M-o") 'paredit-forward-barf-sexp)
  ;; I like these lisp-mode movements better
  (global-set-key (kbd "C-M-n") 'forward-list)
  (global-set-key (kbd "C-M-p") 'backward-list))
